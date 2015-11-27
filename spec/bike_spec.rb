require 'bike'

describe Bike do
  it { is_expected.to respond_to :working? }

  it 'allows a bike to be reported broken' do
    subject.report_broken
    expect(subject.broken?).to eq true
  end
end
