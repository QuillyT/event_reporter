require 'minitest'
require 'minitest/autorun'
require './lib/event_reporter'

class EventReporterTest < Minitest::Test
	def test_it_exists
		er = EventReporter.new
		assert_kind_of EventReporter,er
	end
end