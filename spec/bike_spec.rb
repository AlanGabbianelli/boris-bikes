require 'bike'

describe Bike do
  let(:bike) { described_class.new }

  it { is_expected.to respond_to :working? }

  it 'allows a bike to be reported broken' do
    bike.report_broken
    expect(bike.broken?).to eq true
  end
end
