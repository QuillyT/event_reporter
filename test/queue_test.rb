require 'minitest'
require 'minitest/autorun'
require './lib/queue'

class QueueTest < Minitest::Test
	def test_it_exists
		q = Queue.new
		assert_kind_of Queue, q
	end	
  
  def test_store_result
    q = Queue.new
    results = {first_name: "Johnny"}
    q.store results
    assert_equal results,q.results
  end

	def test_clear_method_clears_data
    skip
		q = Queue.new
		results = {:first_name=>"Johnny"}
		q.store(results)
		q.clear()
    assert_equal q.results,nil
	end
end
