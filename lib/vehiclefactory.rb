require './lib/vehicle'
require './lib/dmv_data_service'


class Vehicle_factory

    def initialize(vehicle_factory)
    @vehicle_factory = vehicle_factory
    end
    
    def create_vehicles
        vehicle = Vehicle.new(@wa_ev_registrations)
        vehicle.vehicle_details[:engine] = :ev
    end
end
