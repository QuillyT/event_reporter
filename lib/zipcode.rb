class Zipcode
	attr_accessor :value

	def initialize(input = nil)
		@value = clean_zipcode(input)
	end

	def clean_zipcode(number)
		if number
	    number = number.to_s.rjust(5,"0")[0..4]
      if number.scan(/^\D+/).length==1
        number = "00000"
      end
		else
			number = "00000"
		end
    number
	end
end
