require 'docking_station'

describe DockingStation do
  it { is_expected.to respond_to :release_bike }

  describe '#initialize' do

    let(:bike) {Bike.new}

    it 'variable capacity' do
      docking_station = DockingStation.new(20)
      20.times { subject.dock(bike) }
      expect { subject.dock(bike) }.to raise_error 'Docking Station is already full'
    end

    it 'has default capacity' do
      docking_station = DockingStation.new
      described_class::DEFAULT_CAPACITY.times { subject.dock(bike) }
      expect { subject.dock(bike) }.to raise_error 'Docking Station is already full'
    end

  end

  it { is_expected.to respond_to(:bikes) }

  it 'returns docked bikes' do
    bike = Bike.new
    subject.dock(bike)
    expect(subject.bikes.last).to eq bike
  end

  describe '#release_bike' do

    it 'releases working bikes' do
      bike = Bike.new
      subject.dock(bike)
      bike = subject.release_bike
      expect(bike.working).to eq true
    end

    it 'raises error if bike is broken' do
      bike = Bike.new
      bike.working = false
      subject.dock(bike)
      expect{subject.release_bike}.to raise_error "This bike is broken"
    end

    it 'releases a bike' do
      bike = Bike.new
      subject.dock(bike)
      expect(subject.release_bike).to eq bike
    end

    it 'raises an error when there are no bikes available' do
      expect { subject.release_bike }.to raise_error 'No bikes available'
    end
  end

  describe '#dock(bike)' do
    it { is_expected.to respond_to(:dock).with(1).argument }

    it 'docks something' do
      bike = Bike.new
      expect(subject.dock(bike)).to eq subject.bikes
    end

    it 'raises an error when bike is already docked' do
      subject.capacity.times { subject.dock(Bike.new) }
      expect { subject.dock(Bike.new) }.to raise_error 'Docking Station is already full'
    end

  end

#  it 'returns true when docking station is full' do
#    20.times { subject.dock(Bike.new) }
#    expect( subject.full? ).to eq true
#  end
#
#  it 'returns true when docking station is empty' do
#    expect( subject.empty? ).to eq true
#  end
end
