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
end
