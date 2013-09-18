require 'minitest'
require 'minitest/autorun'
require './lib/queue'
require './lib/attendee'

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
		q = Queue.new
		results = {:first_name=>"Johnny"}
		q.store(results)
		q.clear()
    assert_equal q.results,nil
	end

  def test_count
    q = Queue.new
    results = []
    5.times do
      results.push Attendee.new
    end
    asset_equal 5,q.count
  end
    
end
