require 'minitest'
require 'minitest/autorun'
require './lib/zipcode'

class ZipcodeTest < Minitest::Test

	def test_it_exists
		zipcode = Zipcode.new
		assert_kind_of Zipcode, zipcode
	end

	def test_it_handles_no_input
		zipcode = Zipcode.new
		assert_equal "00000", zipcode.zipcode
	end

	def test_it_only_grabs_the_five_digit_portion_of_the_entry
		def test_onee
			zipcode = Zipcode.new "20854-0123"
			assert_equal "20854", zipcode.zipcode
		end
	end

	def test_it_throws_away_the_numbers_that_are_too_long
		zipcode = Zipcode.new "123456"
		assert_equal "12345", zipcode.zipcode
	end

	def test_it_add_zeros_to_numbers_that_are_too_short
		zipcode = Zipcode.new "123"
		assert_equal "00123", zipcode.zipcode
	end

	# def test_it_doesnt_accept_none_numeric_entries
	# 	zipcode = Zipcode.new "asdfe"
	# 	assert_equal "00000", zipcode.zipcode
	# end

end
