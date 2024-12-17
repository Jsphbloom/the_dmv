require 'spec_helper'
require 'pry'

RSpec.describe DmvFacilities do
    before do
        @dmvfacility = DmvFacilities.new
        @co_dmv_office_locations = DmvDataService.new.co_dmv_office_locations
        @ny_dmv_office_locations = DmvDataService.new.ny_dmv_office_locations
        @mo_dmv_office_locations = DmvDataService.new.mo_dmv_office_locations
    end
    
    describe "#initialize" do
        it 'can initialize' do
            expect(@dmvfacility).to be_an_instance_of(DmvFacilities)
        end
    end

    describe "#create CO facilities" do
        it 'can create CO facilities and populate with facility details' do
            @dmvfacility.create_facilities(@co_dmv_office_locations)
            expect(@dmvfacility.facilities.length).to eq(5)
        end
    end

    describe "#check specific CO facility in array" do
        it "check office of 2nd facility" do
            @dmvfacility.create_facilities(@co_dmv_office_locations)
            expect(@dmvfacility.facilities[1].name).to eq("DMV Northeast Branch")
        end
    end

    describe "#create NY facilities" do
        it 'can create NY facilities and populate with facility details' do
            @dmvfacility.create_facilities(@ny_dmv_office_locations)
            expect(@dmvfacility.facilities.length).to eq(173)
        end
    end

    describe "#check specific NY facility in array" do
        it "check office of 2nd facility" do
            @dmvfacility.create_facilities(@ny_dmv_office_locations)
            expect(@dmvfacility.facilities[1].name).to eq("HUDSON")
        end
    end

    describe "#create MO facilities" do
        it 'can create MO facilities and populate with facility details' do
            @dmvfacility.create_facilities(@mo_dmv_office_locations)
            expect(@dmvfacility.facilities.length).to eq(174)
        end
    end

    describe "#check specific MO facility in array" do
        it "check office of 2nd facility" do
            @dmvfacility.create_facilities(@mo_dmv_office_locations)
            expect(@dmvfacility.facilities[1].name).to eq("High Ridge")
        end
    end

    describe "#adds all facilities" do
        it "can add facilities from all states at once" do
            @dmvfacility.create_facilities(@mo_dmv_office_locations)
            @dmvfacility.create_facilities(@ny_dmv_office_locations)
            @dmvfacility.create_facilities(@co_dmv_office_locations)

            expect(@dmvfacility.facilities.length).to eq(352)
        end
    end
end