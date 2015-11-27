require 'garage'

describe Garage do

  it { is_expected.to respond_to :receive_bikes_from_van }
  it { is_expected.to respond_to :bikes_to_be_fixed }

  it 'garage can receive broken bikes' do
    bike = double(:bike, broken?: true)
    van = double(:van, bikes_on_board: [bike])
    subject.receive_bikes_from_van(van)
    expect(subject.bikes_to_be_fixed).to eq [bike]
  end


end
