module ShipTypes

  def player_ship
    @space_object.lives = 3
    @space_object.send :extend, Player
  end

  def invader_ship
    @space_object.lives = 1
  end

end
