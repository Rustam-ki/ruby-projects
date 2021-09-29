class CargoTrain<Train
	attr_reader :cargo_railway, :number
	attr_accessor :station, :route

	def initialize(number)
		@cargo_railway = []
		@number = number
	end

	def add_railway(rail)
		if rail.type == "cargo"
			@cargo_railway << rail
		end
	end

	def del_railway(rail)
		self.cargo_railway.delete(rail)
	end

	def router(route)
    @route = route
    self.station = self.route.stations.first
  end

	
end	