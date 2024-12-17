require 'spec_helper'

RSpec.describe VehicleFactory do
    before do
        @factory = VehicleFactory.new
        @wa_ev_registrations = DmvDataService.new.wa_ev_registrations
    end
    
    describe "#initialize" do
        it 'can initialize' do
            expect(@factory).to be_an_instance_of(VehicleFactory)
        end
    end

    describe "#create vehicles" do
        it 'can create vehicles and populate with vehicle details' do
            @factory.create_vehicles(@wa_ev_registrations)
            expect(@factory.cars.length).to eq(1000)
        end
    end

    describe "#check specific car in array" do
        it "check vin of 6th car" do
            @factory.create_vehicles(@wa_ev_registrations)
            expect(@factory.cars[5].vin).to eq("5YJYGDED6M")
        end
    end
end