require 'minitest'
require 'minitest/autorun'
require './lib/queue'

class QueueTest < Minitest::Test
	def test_it_exists
		q = Queue.new
		assert_kind_of Queue, q
	end	
	def test_clear_method_clears_data
    skip
		q = Queue.new
		results = {:first_name=>"Johnny"}
		q.store(results)
		q.clear()
		skip "test this later"
	end

end
