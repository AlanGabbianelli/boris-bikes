require 'van'

describe Van do

  it { is_expected.to respond_to :collect_bikes }
  it { is_expected.to respond_to :bikes_on_board }

  it 'van can pick up broken bikes' do
    bike = double(:bike, broken?: true)
    station = double(:station, separate_broken_bikes: [bike])
    subject.collect_bikes(station)
    expect(subject.bikes_on_board).to eq [bike]
  end

  it 'removes bikes from van once delivered' do
    bike = double(:bike, broken?: true)
    station = double(:station, separate_broken_bikes: [bike])
    garage = double(:garage, receive_bikes_from_van: [] )
    subject.collect_bikes(station)
    garage.recieve_bikes_from_van(subject)
    expect
  end

end
