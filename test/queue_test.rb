require 'minitest'
require 'minitest/autorun'
require './lib/queue'

class QueueTest < Minitest::Test
	def test_it_exists
		q = Queue.new
		assert_kind_of Queue, q
	end	
end