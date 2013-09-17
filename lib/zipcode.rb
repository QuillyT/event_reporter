class Zipcode
	attr_accessor :zipcode 

	def initialize(input = nil)
		@zipcode = clean_zipcode(input)
	end

	def clean_zipcode(number)
		if number
			number = number.rjust(5,"0")[0..4]
		else
			"00000"
		end
	end
end