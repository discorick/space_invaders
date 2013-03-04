require_relative '../dispatchers/dispatcher.rb'

class InvaderArmy

  attr_accessor :invaders

  def initialize
    @invaders = []
  end

  def add_invaders(number)
    number.times{@invaders << Dispatcher.
                 dispatch(SpaceShip.new){ :invader_ship }}
  end

end
