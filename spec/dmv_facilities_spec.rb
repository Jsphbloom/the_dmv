require 'spec_helper'
require 'pry'

RSpec.describe DmvFacilities do
    before do
        @dmvfacilities = DmvFacilities.new
        @co_dmv_office_locations = DmvDataService.new.co_dmv_office_locations
        @ny_dmv_office_locations = DmvDataService.new.ny_dmv_office_locations
        @mo_dmv_office_locations = DmvDataService.new.mo_dmv_office_locations
    end
    
    describe "#initialize" do
        it 'can initialize' do
            expect(@dmvfacilities).to be_an_instance_of(DmvFacilities)
        end
    end

    describe "#create CO facilities" do
        it 'can create CO facilities and hold facility details' do
            @dmvfacilities.create_facilities(@co_dmv_office_locations)
            expect(@dmvfacilities.facilities.length).to eq(5)
            expect(@dmvfacilities.facilities[1].name).to eq("DMV Northeast Branch")
            expect(@dmvfacilities.facilities[1].phone).to eq("(720) 865-4600")
            expect(@dmvfacilities.facilities[1].address).to eq("4685 Peoria Street")
        end
    end

    describe "#create NY facilities" do
        it 'can create NY facilities and hold facility details' do
            @dmvfacilities.create_facilities(@ny_dmv_office_locations)
            expect(@dmvfacilities.facilities.length).to eq(173)
            expect(@dmvfacilities.facilities[0].name).to eq("LAKE PLACID")
            expect(@dmvfacilities.facilities[1].name).to eq("HUDSON")
            expect(@dmvfacilities.facilities[2].name).to eq("RIVERHEAD KIOSK")
        end
    end

    describe "#create MO facilities" do
        it 'can create MO facilities and hold facility details' do
            @dmvfacilities.create_facilities(@mo_dmv_office_locations)
            expect(@dmvfacilities.facilities.length).to eq(174)
            expect(@dmvfacilities.facilities[1].name).to eq("High Ridge")
            expect(@dmvfacilities.facilities[0].address).to eq("2009 Plaza Dr.")
            expect(@dmvfacilities.facilities[2].phone).to eq("(660) 665-0292")
        end
    end

    describe "#adds all facilities" do
        it "can add facilities from all states at once" do
            mo_count = @mo_dmv_office_locations.count
            ny_count = @ny_dmv_office_locations.count
            co_count = @co_dmv_office_locations.count

            @dmvfacilities.create_facilities(@mo_dmv_office_locations)
            expect(@dmvfacilities.facilities.length).to eq(mo_count)

            @dmvfacilities.create_facilities(@ny_dmv_office_locations)
            expect(@dmvfacilities.facilities.length).to eq(mo_count + ny_count)
            
            @dmvfacilities.create_facilities(@co_dmv_office_locations)
            expect(@dmvfacilities.facilities.length).to eq(mo_count + ny_count + co_count)

        end
    end
end