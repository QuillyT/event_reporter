require './lib/attendee'
require 'csv'

class EventReporter
  attr_accessor :attendee_list
	def initialize
		#puts "Initializing Event Reporter!"
    @attendee_list = []
	end

	def run
		command = ""
		while command != 'q'
			printf "Enter command: "
			command = gets.chomp
		end
	end

  def load_file(filename=nil)
    if !filename
      filename = 'event_attendees.csv'
    end
    contents = CSV.open filename, headers: true, header_converters: :symbol
    contents.each do |row|
      input = { first_name:   row[:first_name],
                last_name:    row[:last_name],
                phone_number: row[:phone_number],
                zipcode:      row[:zipcode]}
      @attendee_list.push(Attendee.new(input))
    end
  end

end
