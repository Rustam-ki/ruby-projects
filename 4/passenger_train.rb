class PassengerTrain < Train
	attr_reader :passenger_railway, :number

	def initialize(number)
		@passenger_railway = []
		@number = number
	end

	def add_railway(rail)
		if rail.type == "passenger"
			@passenger_railway << rail
		end
	end
	def del_railway(rail)
		self.passenger_railway.delete(rail)
	end
end	