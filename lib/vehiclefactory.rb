require './lib/vehicle'
require './lib/dmv_data_service'


class Vehicle_factory

    def initialize

    end
    
    def create_vehicles(vehicle)
        vehicle = Vehicle.new({wa_ev_registrations})
        vehicle.vehicle_details << wa_ev_registrations
    end

end
