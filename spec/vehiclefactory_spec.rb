require 'spec_helper'
require './lib/vehiclefactory'

RSpec.describe Vehicle_factory do
    describe "#initialize" do
        it 'can initialize' do
            vehicle_factory = Vehicle_factory.new 
            expect(vehicle_factory).to be_an_instance_of(Vehicle_factory)
        end
    end

    describe "#create vehicles" do
        it 'can create vehicles and populate with vehicle details' do
            
            factory = Vehicle_factory.new
            wa_ev_registrations = DmvDataService.new.wa_ev_registrations
            factory.create_vehicles(wa_ev_registrations)
            expect(factory.cars).to eq([wa_ev_registrations])
        end
    end
end