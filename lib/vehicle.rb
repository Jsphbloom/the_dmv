require 'date'

class Vehicle
  attr_reader :vin,
              :year,
              :make,
              :model,
              :engine,
              :plate_type
    
  attr_accessor :registration_date


  def initialize(vehicle_details)
    @vin = vehicle_details[:vin_1_10]
    @year = vehicle_details[:model_year]
    @make = vehicle_details[:make]
    @model = vehicle_details[:model]
    @engine = vehicle_details[:engine]
    @plate_type = nil
    @registration_date = nil
  end

  def antique?
    Date.today.year - @year.to_i > 25
  end
  
  def electric_vehicle?
    @engine == :ev
  end

  def plate_type
    if antique?
      @plate_type = :antique
    elsif @engine == :ev
      @plate_type = :ev
    else
      @plate_type = :regular
    end
  end
end
