class Bike
  def working?
    !broken?
  end

  def report_broken
    @broken = true
  end

  def broken?
    @broken == nil ? false : true
  end
end
