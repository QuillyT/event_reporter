class Queue
	attr_accessor :results
	def initialize
		@results = []
	end
  
  #store method to store results
  def store(results)
    @results = results
  end

  #clear method to clear results
  def clear()
    @results = nil
  end
end
