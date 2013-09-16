class EventReporter
	def initialize
		puts "Initializing Event Reporter!"
	end

	def run
		command = ""
		while command != 'q'
			printf "Enter command: "
			command = gets.chomp
		end
	end
end

a = EventReporter.new
a.run
