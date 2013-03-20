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

  def add_invader_group(group, number)
    @invaders[group] = []
    number.times{@invaders[group] << Dispatcher.dispatch(SpaceShip.new){ :invader_ship }}
  end

  def each(&block)
    @invaders.each do |group|
      group.each do |invader|
        yield invader
      end
    end
  end

end
