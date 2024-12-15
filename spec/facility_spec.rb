require 'spec_helper'

RSpec.describe Facility do
  before(:each) do
    @facility = Facility.new({name: 'DMV Tremont Branch', address: '2855 Tremont Place Suite 118 Denver CO 80205', phone: '(720) 865-4600'})
  end
  describe '#initialize' do
    it 'can initialize' do
      expect(@facility).to be_an_instance_of(Facility)
      expect(@facility.name).to eq('DMV Tremont Branch')
      expect(@facility.address).to eq('2855 Tremont Place Suite 118 Denver CO 80205')
      expect(@facility.phone).to eq('(720) 865-4600')
      expect(@facility.services).to eq([])
    end
  end

  describe '#add service' do
    it 'can add available services' do
      expect(@facility.services).to eq([])
      @facility.add_service('New Drivers License')
      @facility.add_service('Renew Drivers License')
      @facility.add_service('Vehicle Registration')
      expect(@facility.services).to eq(['New Drivers License', 'Renew Drivers License', 'Vehicle Registration'])
    end
  end

  describe '#register vehicle' do
    it 'can register a vehicle' do
      cruz = Vehicle.new({vin: '123456789abcdefgh', year: 2012, make: 'Chevrolet', model: 'Cruz', engine: :ice} )
      @facility.register_vehicle(cruz)
      expect(@facility.registered_vehicles).to eq([cruz])
    end
  end

  describe '#check registered vehicles' do
    it 'has an array of vehicles' do
      cruz = Vehicle.new({vin: '123456789abcdefgh', year: 2012, make: 'Chevrolet', model: 'Cruz', engine: :ice} )
      bolt = Vehicle.new({vin: '987654321abcdefgh', year: 2019, make: 'Chevrolet', model: 'Bolt', engine: :ev} )
      camaro = Vehicle.new({vin: '1a2b3c4d5e6f', year: 1969, make: 'Chevrolet', model: 'Camaro', engine: :ice} )
      @facility.register_vehicle(cruz)
      @facility.register_vehicle(bolt)
      @facility.register_vehicle(camaro)
      expect(@facility.registered_vehicles).to eq([cruz, bolt, camaro])
    end
  end

  describe '#check fees' do
    it 'has a value of collected fees' do
      cruz = Vehicle.new({vin: '123456789abcdefgh', year: 2012, make: 'Chevrolet', model: 'Cruz', engine: :ice} )
      bolt = Vehicle.new({vin: '987654321abcdefgh', year: 2019, make: 'Chevrolet', model: 'Bolt', engine: :ev} )
      camaro = Vehicle.new({vin: '1a2b3c4d5e6f', year: 1969, make: 'Chevrolet', model: 'Camaro', engine: :ice} )
      @facility.register_vehicle(cruz)
      @facility.register_vehicle(bolt)
      @facility.register_vehicle(camaro)
      expect(@facility.collected_fees).to eq(325)
    end
  end

  describe "#administer_written_test" do
    it "sets written value to true in registrant license data" do
      registrant_1 = Registrant.new('Bruce', 18, true )
      registrant_2 = Registrant.new('Penny', 15 )
      registrant_3 = Registrant.new('Tucker', 15 )
      facility_1 = Facility.new({name: 'DMV Tremont Branch', address: '2855 Tremont Place Suite 118 Denver CO 80205', phone: '(720) 865-4600'})
      facility_2 = Facility.new({name: 'DMV Northeast Branch', address: '4685 Peoria Street Suite 101 Denver CO 80239', phone: '(720) 865-4600'})

      facility_1.add_service('Written Test')
      facility_1.administer_written_test(registrant_1)

      expect(registrant_1.license_data[:written]).to eq(true)
    end
  end

  describe "#administer_road_test" do
  it "sets license value to true in registrant license data" do
    registrant_1 = Registrant.new('Bruce', 18, true )
    registrant_2 = Registrant.new('Penny', 15 )
    registrant_3 = Registrant.new('Tucker', 15 )
    facility_1 = Facility.new({name: 'DMV Tremont Branch', address: '2855 Tremont Place Suite 118 Denver CO 80205', phone: '(720) 865-4600'})
    facility_2 = Facility.new({name: 'DMV Northeast Branch', address: '4685 Peoria Street Suite 101 Denver CO 80239', phone: '(720) 865-4600'})

    facility_1.add_service('Written Test')
    facility_1.add_service('Road Test')
    
    facility_1.administer_written_test(registrant_1)
    facility_1.administer_road_test(registrant_1)

    expect(registrant_1.license_data[:license]).to eq(true)
  end
end

describe "#renew_drivers_license" do
  it "sets renewed value to true in registrant license data" do
    registrant_1 = Registrant.new('Bruce', 18, true )
    registrant_2 = Registrant.new('Penny', 15 )
    registrant_3 = Registrant.new('Tucker', 15 )
    facility_1 = Facility.new({name: 'DMV Tremont Branch', address: '2855 Tremont Place Suite 118 Denver CO 80205', phone: '(720) 865-4600'})
    facility_2 = Facility.new({name: 'DMV Northeast Branch', address: '4685 Peoria Street Suite 101 Denver CO 80239', phone: '(720) 865-4600'})

    facility_1.add_service('Written Test')
    facility_1.add_service('Road Test')
    facility_1.add_service('Renew License')

    facility_1.administer_road_test(registrant_1)
    facility_1.renew_drivers_license(registrant_1)
    expect(registrant_1.license_data[:renewed]).to eq(true)
  end
end


end