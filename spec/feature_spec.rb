require 'docking_station'
require 'van'

describe 'feature test' do

  it 'van collects broken bikes from station' do
    bike = Bike.new
    station = DockingStation.new
    van = Van.new
    bike.report_broken
    station.dock(bike)
    van.collect_bikes(station)
    expect(van.bikes_on_board).to eq [bike]

  end


end
