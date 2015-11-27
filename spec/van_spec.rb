require 'van'

describe Van do

  it { is_expected.to respond_to :collect_bikes }
  it { is_expected.to respond_to :bikes_on_board }

  xit 'van can pick up broken bikes' do
    bike = double(:bike, report_broken: true)
    station = double(:station, :dock)
    bike.report_broken
    station.dock(bike)
    subject.collect_bikes(station)
    expect(subject.bikes_on_board).to eq [bike]
  end



end
