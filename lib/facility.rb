class Facility
  attr_reader :name, :address, :phone, :services

  def initialize(facility_details)

    @name = facility_details[:name]
    @address = facility_details[:address]
    @phone = facility_details[:phone]
    @services = []
    @registered_vehicles = []
    @collected_fees = 0

  end

  def add_service(service)

    @services << service
  end

  def registered_vehicles
    @registered_vehicles
  end

  def collected_fees
    @collected_fees
  end

  def register_vehicle(vehicle)

      if vehicle.antique?
        @collected_fees += 25
        @registered_vehicles << vehicle

      elsif vehicle.engine == :ev
        @collected_fees += 200
        @registered_vehicles << vehicle

      else
        @collected_fees += 100
        @registered_vehicles << vehicle

      end
  end

  def plate_type(vehicle)
    if vehicle.antique?
      @plate_type << :antique
    
    elsif vehicle.electric_vehicle?
      @plate_type << :ev
    
    else
    @plate_type << :regular
    end
  end
end
