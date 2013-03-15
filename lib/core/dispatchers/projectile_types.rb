module ProjectileTypes

  def bullet
    @space_object.send :extend, Bullet
  end

  def laser
    @space_object.send :extend, Laser
  end

end
