class Garage
  attr_reader :bikes_to_be_fixed

  def receive_bikes_from_van(van)
    @bikes_to_be_fixed = (van.bikes_on_board)
    @bikes_to_be_fixed
  end
end
