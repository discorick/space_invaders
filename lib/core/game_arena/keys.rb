module Keys

  def self.ship_bindings window
    bindings = {Gosu::KbLeft => :move_left,
                Gosu::KbRight => :move_right}
  end

  def self.engine_bindings window
    bindings = {Gosu::KbSpace => [:player_fire, window]}
  end

end
