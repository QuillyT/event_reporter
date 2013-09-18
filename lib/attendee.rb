class Attendee
  attr_accessor :first_name, :last_name, :phone_number, :zipcode

  def initialize(input = {})
    @first_name = input[:first_name]
    @last_name = input[:last_name]
    @phone_number = PhoneNumber.new(input[:phone_number]).value
    @zipcode = Zipcode.new(input[:zipcode]).value
  end
end
