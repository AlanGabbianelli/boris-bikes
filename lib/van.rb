require 'docking_station'

class Van
  attr_reader :bikes_on_board

  def collect_bikes(station)
    @bikes_on_board = station.separate_broken_bikes
  end
end
