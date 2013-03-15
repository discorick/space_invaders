module Invader

  attr_accessor :x, :y, :shots_fired, :dead, :obstructed

  def setup window, type
   @window = window
   @height = @width = 1
   @x = @y = @angle = 0.0
   @invader_types = {:type1 => Constants::SpaceCraft::INVADER1,
                     :type2 => Constants::SpaceCraft::INVADER2,
                     :type3 => Constants::SpaceCraft::INVADER3}
   @image = Gosu::Image.new(@window, @invader_types[type], false)
   @repeat_hit = false
   @dead, @obstructed = false, true
   @shots_fired = []
  end

  def hits_border?
    result = true if @x == 25 or @x == 775
    result = false if @repeat_hit 
    @repeat_hit = result
    result
  end

  def fire?(projectile)
    if rand(1000) < 1
      build projectile unless @dead or @obstructed
    end
  end

  def build projectile
    shot = Dispatcher.dispatch(Projectile.new){ projectile }
    shot.setup @window
    shot.x, shot.y = @x, @y + 15
    @shots_fired << shot
  end

  def draw 
    @image.draw_rot(@x, @y, 1, @angle)
  end

end
