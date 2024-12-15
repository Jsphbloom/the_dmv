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

    vehicle.registration_date = Date.today.strftime("%m/%d/%Y")

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

  def administer_written_test(registrant)
    if @services.include?("Written Test")
      registrant.license_data[:written] = true
    else
      false
    end
  end

  def administer_road_test(registrant)
    if @services.include?("Road Test")
      registrant.license_data[:license] = true
    else
     false
    end
  end

end
