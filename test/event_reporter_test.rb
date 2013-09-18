require 'minitest'
require 'minitest/autorun'
require './lib/event_reporter'
require './lib/attendee'

class EventReporterTest < Minitest::Test
	def test_it_exists
		er = EventReporter.new
		assert_kind_of EventReporter,er
	end
  def test_load_file_test_gets_first_entry
      er = EventReporter.new
      er.load_file('event_attendees.csv')
      a = er.attendee_list[0]
      assert_equal 'Allison', a.first_name
  end

end
