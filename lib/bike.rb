class Bike

  attr_accessor :working

  def initialize
    @working = true
  end

  def report_broken
    @broken = true
  end

  def broken?
    @broken
  end

end
