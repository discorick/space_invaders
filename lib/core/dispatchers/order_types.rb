module OrderTypes

  def spaceship_orders
    @space_object.add :bullet => lambda {Dispatcher.dispatch(Projectile.new){ :bullet }}
    @space_object.add :laser => lambda {Dispatcher.dispatch(Projectile.new){ :laser }}
  end

end
