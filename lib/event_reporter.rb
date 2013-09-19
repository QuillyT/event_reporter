require 'csv'
require 'pry'
require './lib/attendee'
require './lib/queue'
require './lib/help'

class EventReporter
  attr_accessor :contents, :queue, :help
  def initialize
    puts "Initializing Event Reporter!"
    @content = []
    @queue = Queue.new
    @help = Help.new
  end

  def load_file(filename=nil)
    filename = 'event_attendees.csv' if filename.nil?
    begin
      @contents = CSV.open filename, headers: true, header_converters: :symbol
    rescue
      puts "Error loading file."
    end
    
  end

  def prompt_user
    printf "Enter command: "
    gets.chomp
  end

  def load(parts=nil)
    filename = parts[1]
    load_file(filename)
  end

  def helper?(input)
    @help.messages.has_key? input.to_sym
  end

  def help_options(parts)
    if !parts[1].nil?
      symbol = parts[1..-1].join("_")
      puts @help.get_message(symbol.to_sym) if helper? symbol  
      puts @help.get_message(:none) if !(helper? symbol)
      #binding.pry
    else
      puts @help.get_message(:help)
    end
  end

  def count
    puts "There are #{@queue.count} search results."
  end

  def clear
    @queue.clear
    puts "Cleared the search results."
  end

  def print(parts)
    if parts[2]=="by" && parts[3]
      attribute = parts[3]
      @queue.print_by(attribute.to_sym)
    elsif parts[2].nil? && parts[3].nil?
      @queue.print
    elsif parts[2]!="by"
      puts "Invalid call to print."
    end
    #binding.pry
  end

  def save(parts)
    if parts[3] && parts[2]=="to"
      @queue.save(parts[3])
    else
      puts "Invalid call to save."
    end
    #binding.pry
  end

  def queue_options(parts)
    if !(parts[1].nil?)
      case parts[1]
      when 'count' then count
      when 'clear' then clear
      when 'print' then print parts
      when 'save' then save parts
      else puts "Invalid queue command."
      end
    end
    #binding.pry
  end

  def attribute?(part)
    if part
      ["first_name","last_name","homephone","zipcode",
        "email","city","address","state"].include? part
    else
      false
    end
  end

  def find(parts)
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

  def process(input)
    parts = input.split
    command = parts[0]
    case command
      when 'quit' then 
        puts "Goodbye!"
      when 'load' then load parts
      when 'help' then help_options parts
      when 'queue' then queue_options parts
      when 'find' then find parts
      else puts "Invalid command."
    end
    puts ""
  end

  def run
    input = ""
    while input != 'quit'
      input = prompt_user
      process input
    end
  end
end

er = EventReporter.new
er.run
