module ShipTypes

  def player_ship
    @space_object.lives = 3
    @space_object.send :extend, Player
    @space_object.weapon = Weapon.new
  end

  def invader_ship
    @space_object.lives = 1
    @space_object.send :extend, Invader
    @space_object.class.module_eval { attr_accessor :offset_x, :offset_y, :index }
    @space_object.index = [0,0]
    @space_object.offset_x = @space_object.offset_y = 50
  end

  def army_container
    @space_object.send :extend, ArmyContainer
  end

end
