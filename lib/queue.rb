require 'pry'

class Queue
  attr_accessor :results
  def initialize
    @results = []
  end

  def clear
    @results = []
  end

  def count
    @results.length
  end

  def print_header
    puts "\n\nLAST NAME\tFIRST NAME\tEMAIL\tZIPCODE\
\tCITY\tSTATE\tADDRESS\tPHONE"
  end

  def print
    print_header
    @results.each do |person|
      puts "#{person.last_name}\t#{person.first_name}\
\t#{person.email_address}\t#{person.zipcode}\t#{person.city}\
\t#{person.state}\t#{person.street}\t#{person.homephone}"
    end
  end

  def print_by(input)
    print_header
    printme = @results.sort_by{|person|person.send(input)}
    printme.each do |person|
      puts "#{person.last_name}\t#{person.first_name}\
\t#{person.email_address}\t#{person.zipcode}\t#{person.city}\
\t#{person.state}\t#{person.street}\t#{person.homephone}"
    end
  end

  def save(filename)
    if filename[-4..-1]==".csv"
      filename   
      out = File.open(filename,"w")
      out.write("first_Name,last_Name,Email_Address,HomePhone,Street,City,State,\
Zipcode\n")
      @results.each do |person|
        out.write("#{person.first_name},#{person.last_name},\
#{person.email_address},#{person.homephone},#{person.street},\
#{person.city},#{person.state},#{person.zipcode}\n")
      end
      binding.pry
    else
      puts "Invalid filename."
    end
  end
end
