class Weapon
  attr_accessor :type, :armory

  def initialize
    @type = :cannon
    @armory = {:cannon => :bullet,
              :laser_gun => :laser}
  end

  def fire
    Dispatcher.dispatch(Projectile.new){@armory[@type]}
  end

  def add weapon
    @armory = @armory.merge(weapon) 
  end

  def change_to weapon
    @type = weapon
  end

end
