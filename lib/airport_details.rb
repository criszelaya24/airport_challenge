require_relative 'weather'
# Class to know the status of the aircraft and airport
class Airport
	attr_reader :weather, :hangar
	def initialize(weather = Weather.new)
		@hangar = []
		@weather = weather
	end

	DEFAULT_CAPACITY = 20

	def full?
		@hangar.count >= DEFAULT_CAPACITY
	end

	def empty?
		@hangar.empty?
	end

	def land
		fail 'You can not land the aircraft because the airport is full' if full?
		#fail 'You can not land the aircraft because of the storm' if @weather.stormy? == true
		@hangar << +1
		@hangar.count and true
	end

	def take_off
		fail 'You can not take off the aircraft because is emty' if empty?
		#fail 'You can not take off the aircraft because of the storm' if @weather.stormy? == true
		@hangar.pop
		true
	end
end