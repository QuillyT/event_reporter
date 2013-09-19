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
    OutputHandler.output(EventReporterMessage.prompt)
    gets.chomp
  end

  def process(input)
    entered_command,remainder = input.split(" ",2)
    found_command = commands.find{|command|command==entered_command.to_sym}
    execute(found_command,remainder)
  end

  def commands
    commands = [:load,:find,:help,:queue,:quit]
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
    rescue
      puts "Error loading file."
    end
  end

  def find
    OutputHandler.output("finding results")
  end

  def help
    OutputHandler.output("displaying help")
  end

  def queue
    OutputHandler.output("queue commands")
  end

  def quit
    OutputHandler.output("Exiting Event Reporter. Goodbye!")
    exit true
  end

  def no_command(args=nil)
    OutputHandler.output(EventReporterMessage.invalid)
  end

  def count
    puts "There are #{@queue.count} search results."
  end

  def clear
    @queue.clear
    puts "Cleared the search results."
  end

  def attribute?(part)
    if part
      ["first_name","last_name","homephone","zipcode",
        "email","city","address","state"].include? part
    else
      false
    end
  end

  def find_h(parts)
    if attribute? parts[1]
      if !@contents.nil?
        clear
        attribute = parts[1]
        criteria = parts[2]
        results = @contents.find_all do |row|
          row[attribute.to_sym]==criteria
        end
        results.collect do |row|
          @queue.results.push Attendee.new(row)
        end
        @contents.rewind
        puts "New results stored."
      else
        puts "No data loaded."
      end
    else
      puts "Invalide attribute."
    end
  end

  def initialize
    puts "Initializing Event Reporter!"
    @content = []
    @queue = Queue.new
    @help = Help.new
  end
end

class OutputHandler
  def self.output(message)
    puts message.to_s
  end
end

class EventReporterMessage
  def self.prompt
    %(Enter Command: )
  end
  def self.quit
    %(Exiting Event Reporter. Goodbye!)
  end
  def self.invalid
    %(Invalid command.)
  end
  def self.load
  end
  def self.find
  end
  def self.help
  end
end
