module Keys

  def self.bindings
    @bindings = {Gosu::KbLeft => :move_left,
                 Gosu::KbRight => :move_right}
  end

end
