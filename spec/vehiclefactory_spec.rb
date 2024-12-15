require 'spec_helper'

RSpec.describe Vehicle_factory do
    @vehicle_factory = Vehicle_factory.new(DmvDataService.new.wa_ev_registrations)  
    describe "#initialize" do
    it 'can initialize' do
        expect(@vehicle_factory).to be_an_instance_of(Vehicle_factory)
        end
    end
end