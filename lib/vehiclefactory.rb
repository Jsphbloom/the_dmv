require './lib/vehicle'
require './lib/dmv_data_service'


class Vehicle_factory
attr_accessor :cars
    def initialize
        @cars = []
    end
    
    def create_vehicles(vehicle_details)
        vehicle_details.each do |vehicle|
            new_vehicle = Vehicle.new({
            vehicle_details[:vin],
            vehicle_details[:year],
            vehicle_details[:make],
            vehicle_details[:model],
            vehicle_details[:engine] = :ev
            })
            if new_vehicle.model == "Prius Plug-in"
                @cars << new_vehicle
            end
        end
    end
end
