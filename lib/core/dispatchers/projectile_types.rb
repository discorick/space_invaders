module ProjectileTypes

  def bullet
    @space_object.send :extend, Bullet
  end

  def laser
    #No Actor Build Yet
  end

end
