require 'bike'

describe Bike do
  let(:bike) { described_class.new }

  it 'initialize as working' do
    expect(bike.working?).to be true
  end

  it 'initialize as not broken' do
    expect(bike.broken?).to be false
  end

  it 'allows a bike to be reported broken' do
    bike.report_broken
    expect(bike.broken?).to eq true
  end
end
