require 'csv'
require 'pry'
require './lib/attendee'
require './lib/queue'
require './lib/help'

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
      @contents = CSV.open filename, headers: true, header_converters: :symbol
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
    results = @contents.find_all{|row|row[attribute.to_sym]==criteria}
    push_attendees_to_queue(results)
  end

  def push_attendees_to_queue(results)
    @queue = results.collect{|row|Attendee.new(row)}
    OutputHandler.output(EventReporterMessage.find)
  end

  def good_arguments?(attribute,criteria)
    not (attribute_not_okay?(attribute)||criteria_nil?(criteria))
  end

  def attribute_not_okay?(attribute)
    attribute_is_bad = not(valid_attributes.find_index attribute)
    OutputHandler.output(EventReporterMessage.bad_attribute) if attribute_is_bad
    attribute_is_bad
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
    entered_command,remainder = input.split(" ",2)
    entered_command||=""
    found_command = queue_commands.find{|command|command==entered_command.to_sym}
    execute(found_command,remainder)
  end

  def queue_commands
    [:count,:clear,:print,:print_by,:save_to]
  end

  def count
    OutputHandler.print(EventReporterMessage.count)
    OutputHandler.output(@results_queue.count)
  end

  def clear
    @queue.clear
    OutputHandler.output(EventReporterMessage.clear)
  end

  def quit(args=nil)
    OutputHandler.output("Exiting Event Reporter. Goodbye!")
    exit true
  end

  def no_command(args=nil)
    OutputHandler.output(EventReporterMessage.invalid)
  end

  def attribute?(part)
    if part
      ["first_name","last_name","homephone","zipcode",
        "email","city","address","state"].include? part
    else
      false
    end
  end

  def initialize
    puts "Initializing Event Reporter!"
    @contents = []
    @queue = Queue.new
  end
end

class OutputHandler
  def self.output(message)
    puts message.to_s
  end
  def self.print(message)
    printf "\n"+message.to_s
  end
end
