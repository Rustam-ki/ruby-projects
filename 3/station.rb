class Station
	attr_reader :name
	attr_reader :trains

	def initialize(name)
		@name = name
		@trains = []
	end

	def add_train(train)
		self.trains << train
	end

	def del_rain(train)
		self.trains.delete(train)
	end

	def by_type(type)
		self.trains.each do |train|
			if train.type == type
				puts train
			end
		end
	end
end