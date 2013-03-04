class SpaceShip

  attr_accessor :lives, :weapon, :position, :size

  def initialize
    @lives = 1
    @weapon = :laser
    @position = [0,0]
    @size = [1,1]
  end

  def add_life
    @lives += 1
  end

  def remove_life
    @lives -= 1
  end

end
