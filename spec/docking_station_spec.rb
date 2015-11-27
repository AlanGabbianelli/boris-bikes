require 'docking_station'

describe DockingStation do
  it { is_expected.to respond_to :release_bike }

let(:bike) {double :bike}

  describe '#initialize' do

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
    subject.dock(bike)
    expect(subject.bikes.last).to eq bike
  end

  describe '#release_bike' do

    it 'releases working bikes' do

      bike = double(:bike, working?: true, broken?: false)
      subject.dock(bike)
      bike = subject.release_bike
      expect(bike.working?).to eq true
    end

    it 'releases a bike' do
      bike = double(:bike, broken?: false)
      subject.dock(bike)
      expect(subject.release_bike).to eq bike
    end

    it 'raises an error when there are no bikes available' do
      expect { subject.release_bike }.to raise_error 'No bikes available'
    end

    it 'raises an error when trying to release broken bikes' do
      bike = double(:bike, broken?: true, report_broken: true)
      bike.report_broken
      subject.dock(bike)
      expect{ subject.release_bike }.to raise_error 'This bike is broken'
    end
  end

  describe '#dock(bike)' do
    it { is_expected.to respond_to(:dock).with(1).argument }

    it 'docks something' do
      expect(subject.dock(bike)).to eq subject.bikes
    end

    it 'raises an error when bike is already docked' do
      subject.capacity.times { subject.dock(:bike) }
      expect { subject.dock(:bike) }.to raise_error 'Docking Station is already full'
    end

  end

  describe '#separate_broken_bikes' do
    it 'can separate broken bikes' do
      working_bike = double(:bike, broken?: false)
      broken_bike = double(:bike, broken?: true)
      subject.dock(working_bike)
      subject.dock(broken_bike)
      expect(subject.separate_broken_bikes).to eq [broken_bike]
    end

    it 'can separate working bikes' do
      working_bike = double(:bike, broken?: false)
      broken_bike = double(:bike, broken?: true)
      subject.dock(working_bike)
      subject.dock(broken_bike)
      subject.separate_broken_bikes
      expect(subject.bikes).to eq [working_bike]
    end
  end

end
