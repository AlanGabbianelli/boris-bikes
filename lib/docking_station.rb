require_relative 'bike'

class DockingStation

  attr_reader :bikes, :capacity, :broken_bikes

  DEFAULT_CAPACITY = 20

  def initialize(capacity = DEFAULT_CAPACITY)
    @bikes = []
    @capacity = capacity
  end

  def release_bike
    fail 'No bikes available' if empty?
    fail 'This bike is broken' if @bikes.last.broken?
    @bikes.pop
  end

  def dock(bike)
    fail 'Docking Station is already full' if full?
    @bikes << bike
  end

  def separate_broken_bikes
    @broken_bikes = @bikes.select { |bike| bike.broken? }
    remove_broken_bikes_from_dock
    @broken_bikes
  end

  private

  def full?
    @bikes.length >= capacity ? true : false
  end


  def empty?
    @bikes.length == 0 ? true : false
  end

  def remove_broken_bikes_from_dock
    @bikes = @bikes.reject { |bike| bike.broken? }
  end

end
