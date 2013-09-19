require './lib/zipcode'
require './lib/phone_number'

class Attendee
  attr_accessor :first_name, :last_name, :homephone, :zipcode, :email_address, :city, :street, :state

  def initialize(input = {})
    @last_name = input[:last_name]
    @first_name = input[:first_name]
    @email_address = input[:email_address]
    @zipcode = Zipcode.new(input[:zipcode]).value
    @city = input[:city]
    @state = input[:state]
    @street = input[:street]
    @homephone = PhoneNumber.new(input[:homephone]).value
  end
end
