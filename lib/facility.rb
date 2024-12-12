class Facility
  attr_reader :name, :address, :phone, :services

  def initialize(facility_details)
    facility_details = Hash.new
    @name = facility_details[:name]
    @address = facility_details[:address]
    @phone = facility_details[:phone]
    @services = []
  end

  def add_service(service)
    @services << service
  end
end
