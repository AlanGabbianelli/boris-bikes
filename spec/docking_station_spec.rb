require 'docking_station'

describe DockingStation do
  let(:docking_station) { described_class.new }
  let(:bike) { double :bike }

  it { is_expected.to respond_to :release_bike }

  describe '#initialize' do
    it 'variable capacity' do
      error = 'Docking Station is already full'
      docking_station_2 = described_class.new(30)
      30.times { docking_station_2.dock(bike) }
      expect { docking_station_2.dock(bike) }.to raise_error error
    end

    it 'has default capacity' do
      error = 'Docking Station is already full'
      described_class::DEFAULT_CAPACITY.times { subject.dock(bike) }
      expect { docking_station.dock(bike) }.to raise_error error
    end
  end

  it { is_expected.to respond_to(:bikes) }

  it 'returns docked bikes' do
    subject.dock(bike)
    expect(docking_station.bikes.last).to eq bike
  end

  describe '#release_bike' do
    it 'releases working bikes' do
      bike = double(:bike, working?: true, broken?: false)
      docking_station.dock(bike)
      bike = docking_station.release_bike
      expect(bike.working?).to eq true
    end

    it 'releases a bike' do
      bike = double(:bike, broken?: false)
      docking_station.dock(bike)
      expect(docking_station.release_bike).to eq bike
    end

    it 'raises an error when there are no bikes available' do
      error = 'No bikes available'
      expect { docking_station.release_bike }.to raise_error error
    end

    it 'raises an error when trying to release broken bikes' do
      error = 'This bike is broken'
      bike = double(:bike, broken?: true, report_broken: true)
      bike.report_broken
      docking_station.dock(bike)
      expect { docking_station.release_bike }.to raise_error error
    end
  end

  describe '#dock(bike)' do
    it { is_expected.to respond_to(:dock).with(1).argument }

    it 'docks something' do
      expect(docking_station.dock(bike)).to eq subject.bikes
    end

    it 'raises an error when bike is already docked' do
      error = 'Docking Station is already full'
      docking_station.capacity.times { docking_station.dock(:bike) }
      expect { docking_station.dock(:bike) }.to raise_error error
    end
  end

  describe '#separate_broken_bikes' do
    it 'can separate broken bikes' do
      working_bike = double(:bike, broken?: false)
      broken_bike = double(:bike, broken?: true)
      docking_station.dock(working_bike)
      docking_station.dock(broken_bike)
      expect(docking_station.separate_broken_bikes).to eq [broken_bike]
    end

    it 'can separate working bikes' do
      working_bike = double(:bike, broken?: false)
      broken_bike = double(:bike, broken?: true)
      docking_station.dock(working_bike)
      docking_station.dock(broken_bike)
      docking_station.separate_broken_bikes
      expect(docking_station.bikes).to eq [working_bike]
    end
  end
end
