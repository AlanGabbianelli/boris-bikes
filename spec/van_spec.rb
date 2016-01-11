require 'van'

describe Van do
  let(:van) { described_class.new }

  it { is_expected.to respond_to :collect_bikes }
  it { is_expected.to respond_to :bikes_on_board }

  it 'van can pick up broken bikes' do
    bike = double(:bike, broken?: true)
    station = double(:station, separate_broken_bikes: [bike])
    van.collect_bikes(station)
    expect(van.bikes_on_board).to eq [bike]
  end
end
