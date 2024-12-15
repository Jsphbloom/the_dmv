require './lib/vehicle'
require './lib/dmv_data_service'


class Vehicle_factory
attr_accessor :cars
    def initialize
        @cars = []
    end
    
    def create_vehicles(registrations)
        registrations.each do |registration|
            @cars << Vehicle.new(registration)
        end
        return @cars
    end
end
