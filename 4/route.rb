class Route 
	attr_accessor :stations

	def initialize(start, ending)
		@stations = [start, ending]
	end

	def add_st(station)
		@stations.insert(-2, station)
	end

	def del_st(station)
		@stations.delete(station)
	end
end
