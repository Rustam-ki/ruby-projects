class CargoTrain<Train
	attr_reader :number, :type
	attr_accessor :railway
	

	def initialize(number, type)
		@number = number
		@type = type
	end

end	