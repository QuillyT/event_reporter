require 'minitest'
require 'minitest/autorun'
require './lib/phone_number'

class PhoneNumberTest	 < MiniTest::Test
	def test_it_exists
		phone = PhoneNumber.new
		assert_kind_of PhoneNumber, phone
	end
	def test_it_handles_no_input
		phone = PhoneNumber.new
		assert_equal "0000000000", phone.number
	end
	def test_it_cleans_up_phone_numbers_with_periods_and_hyphens
    phone = PhoneNumber.new("202.444-9382")
    assert_equal "2024449382", phone.number
  end

  def test_it_cleans_up_phone_numbers_with_spaces_and_parentheses
    phone = PhoneNumber.new("(202) 444 9382")
    assert_equal "2024449382", phone.number
  end

  def test_it_removes_leading_one_from_an_eleven_digit_phone_number
    phone = PhoneNumber.new("12024449382")
    assert_equal "2024449382", phone.number
  end

  def test_it_throws_away_phone_numbers_that_are_too_long
    phone = PhoneNumber.new("23334445555")
    assert_equal "0000000000", phone.number
  end

  def test_it_throws_away_phone_numbers_that_are_too_short
    phone = PhoneNumber.new("222333444")
    assert_equal "0000000000", phone.number
  end
end
