require 'pry'

class Dmv
attr_reader :facilities
  def initialize
    @facilities = []
  end

  def add_facility(facility)
    facility_locations.each do |facility|
      @facilities << facility
    end
  end

  def facilities_offering_service(service)
    @facilities.find_all do |facility|
      facility.services.include?(service)
    end
  end


end
#branch 3