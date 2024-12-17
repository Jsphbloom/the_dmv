require './lib/vehicle'
require './lib/dmv_data_service'


class VehicleFactory
attr_accessor :cars
    def initialize
        @cars = []
    end
    
    def create_vehicles(vehicle_details)
        vehicle_details.each do |vehicle|
            new_vehicle = Vehicle.new(vehicle)          
            @cars << new_vehicle
        end
        return @cars
    end
end
