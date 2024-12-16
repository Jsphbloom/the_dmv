require 'spec_helper'
require './lib/vehiclefactory'

RSpec.describe Vehicle_factory do
    # before do
    #     @prius = [{:vin_1_10=>"JTDKN3DP3C",
    #     :dol_vehicle_id=>"229686908",
    #     :model_year=>"2013",
    #     :make=>"TOYOTA",
    #     :model=>"Prius Plug-in"}]
    # end

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
            expect(factory.cars.length).to eq(1000)
        end
    end
end