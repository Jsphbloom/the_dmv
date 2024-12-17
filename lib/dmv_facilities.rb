require './lib/facility'
require './lib/dmv_data_service'


class DmvFacilities
    attr_accessor :facilities
        def initialize
            @facilities = []
        end
        
        def create_facilities(facility_details)
            facility_details.each do |facility|
                new_facility = Facility.new(facility)          
                @facilities << new_facility
            end
            return @facilities
        end
    end
    