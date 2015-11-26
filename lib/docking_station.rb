require_relative 'bike'

class DockingStation

  attr_reader :bikes, :capacity

  DEFAULT_CAPACITY = 20

  def initialize(capacity = DEFAULT_CAPACITY)
    @bikes = []
    @capacity = capacity
  end

  def release_bike
    fail 'No bikes available' if empty?
    @bikes.pop
  end

  def dock(bike)
    fail 'Docking Station is already full' if full?
    @bikes << bike
  end

  private

  def full?
    @bikes.length >= capacity ? true : false
  end

  def empty?
    @bikes.length == 0 ? true : false
  end
end
