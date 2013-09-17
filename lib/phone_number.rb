class PhoneNumber
	attr_accessor :number

	def initialize(input = nil)
		@number = clean_phone_number(input)
	end

	def clean_phone_number(number)
		if number
      number = number.scan(/[0-9]/).join
      if number.length == 11 && number.start_with?("1")
        number = number[1..-1]
      end
      if number.length != 10
        number = "0000000000"
      end
      return number
    else
      return "0000000000"
    end
  end
end
