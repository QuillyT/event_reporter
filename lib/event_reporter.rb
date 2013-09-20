require 'csv'
require 'pry'
require './lib/attendee'
require './lib/queue'
require './lib/help'
require './lib/output_handler'
require './lib/event_reporter_message'

class EventReporter
  attr_accessor :contents, :results_queue

  def run
    input = ""
    while input != 'quit'
      input = prompt_for_input
      process input
    end
  end

  def prompt_for_input
    OutputHandler.print(EventReporterMessage.prompt)
    gets.chomp
  end

  def process(input)
    entered_command,remainder = input.split(" ",2)
    entered_command||=""
    found_command = commands.find{|command|command==entered_command.to_sym}
    execute(found_command,remainder)
  end

  def commands
    [:load,:find,:help,:queue,:quit]
  end

  def execute(command,args)
    command ||= :no_command
    send(command,args)
  end

  def load(filename)
    filename||=default_file_name
    load_csv_file(filename)
  end

  def default_file_name
    "event_attendees.csv"
  end

  def load_csv_file(filename)
    begin
      @contents = CSV.read filename, headers: true, header_converters: :symbol
      OutputHandler.output(EventReporterMessage.loaded)
    rescue
      OutputHandler.output(EventReporterMessage.load_error)
    end
  end

  def find(args)
    args||=""
    attribute,criteria = args.split(" ",2)
    update_queue(attribute,criteria) if good_arguments?(attribute,criteria)
  end

  def update_queue(attribute,criteria)
    results = @contents.find_all{|row|row[attribute_converter(attribute)].downcase==criteria.downcase}
    set_queue_to_attendees(results)
  end

  def attribute_converter(attribute)
    { "first_name"=>:first_name,
      "last_name"=>:last_name,
      "phone_number"=>:homephone,
      "zipcode"=>:zipcode,
      "city"=>:city,
      "state"=>:state,
      "address"=>:street,
      "email"=>:email_address}
  end

  def set_queue_to_attendees(results)
    @results_queue.results = results.collect{|row|Attendee.new(row)}
    OutputHandler.output(EventReporterMessage.find)
  end

  def good_arguments?(attribute,criteria)
    not (attribute_not_okay?(attribute)||criteria_nil?(criteria))
  end

  def attribute_not_okay?(attribute)
    not(is_valid_attribute?(attribute))
  end

  def is_valid_attribute?(attribute)
    good_attribute = (valid_attributes.find_index(attribute) && true)
    OutputHandler.output(EventReporterMessage.bad_attribute) if not good_attribute
    good_attribute
  end

  def criteria_nil?(criteria)
    criteria_is_empty = criteria.nil?
    OutputHandler.output(EventReporterMessage.criteria_empty) if criteria_is_empty
    criteria_is_empty
  end

  def valid_attributes
    ["first_name","last_name","phone_number","zipcode","city","state","address","email"]
  end

  def help(arg=nil)
    (arg) ? output_help_message(arg) : output_default_help_message
  end

  def output_default_help_message
    OutputHandler.output(Help.default)
  end

  def output_help_message(arg)
    OutputHandler.output(Help.message(arg))
  end

  def queue(args)
    args||=""
    entered_command,remainder = args.split(" ",2)
    entered_command||=""
    found_command = queue_commands.find{|command|command==entered_command.to_sym}
    execute(found_command,remainder)
  end

  def queue_commands
    [:count,:clear,:print,:print,:save]
  end

  def count(args=nil)
    OutputHandler.print(EventReporterMessage.count)
    OutputHandler.output(@results_queue.count)
  end

  def clear(args=nil)
    @results_queue.clear
    OutputHandler.output(EventReporterMessage.clear)
  end

  def print(args=nil)
    if(args==nil)
      print_results
    else
      print_by(args)
    end
  end

  def print_results
    @results_queue.print
  end

  def print_by(args)
    @results_queue.print_by(args) if print_by_attribute? args
  end

  def print_by_attribute?(command,attribute)
    is_print_by?(command) && is_valid_attribute?(attribute)
  end

  def is_print_by?(command)
    is_by = (command=='by')
    OutputHandler.output(EventReporterMessage.invalid) if not is_by
    is_by
  end

  def save(args=nil)
    args||=""
    @results.save(args) if save_conditions_okay?(args)
  end

  def save_conditions_okay?(args)
    command,filename = args.split(" ",2)
    is_save_to?(command) && valid_file_name?(filename) && !file_exists?(filename)
  end

  def is_save_to?(args)
    is_to = (args=="to")
    OutputHandler.output(EventReporterMessage.invalid) if not is_to
    is_to
  end

  def valid_file_name?(args)
    good_file_name = (args[-4..-1]==".csv")
    OutputHandler.output(EventReporterMessage.invalid_filename) if not good_file_name
    good_file_name
  end

  def file_exists?(args)
    file_exists = File.exists?(args)
    OutputHandler.output(EventReporterMessage.invalid_file_exists) if file_exists
    file_exists
  end

  def quit(args=nil)
    OutputHandler.output("Exiting Event Reporter. Goodbye!")
    exit true
  end

  def no_command(args=nil)
    OutputHandler.output(EventReporterMessage.invalid)
  end

  def initialize
    puts "Initializing Event Reporter!"
    @contents = []
    @results_queue = Queue.new
  end
end
