class Queue
	attr_accessor :results
	def initialize
		@results = []
	end
  
  def store(results)
    @results = results
  end

  def clear
    @results = {}
  end

  def count
    @results.length
  end
end
