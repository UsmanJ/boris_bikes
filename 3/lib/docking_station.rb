class DockingStation
	DEFAULT_CAPACITY = 20
	attr_accessor :capacity

	def initialize
		@bikes = []
		@capacity = DEFAULT_CAPACITY
	end

	def release_bike
		fail 'No bikes available' if empty?
		@bikes.pop
	end

	def dont_release_if_broken
		fail 'Bike broken' if !@bike_working
	end

	def dock(bike)
		fail 'Docking station full' if full?
		@bikes << bike
	end
end

private

def full?
	@bikes.count >= capacity
end

def empty?
	@bikes.empty?
end
