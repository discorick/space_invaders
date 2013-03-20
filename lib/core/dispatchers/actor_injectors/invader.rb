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
   @dead, @obstructed, @hit = false, true, false
   @shots_fired = []
  end

  def each(&block)
    @shots_fired.each do |sf|
      yield sf
    end
  end

  def hits_border?
    return false if @dead
    result = true if @x == 25 or @x == 775
    result = false if @repeat_hit 
    @repeat_hit = result
    result
  end

  def is_hit? projectile
    projectile.each do |shot|
      @dead = true if Gosu::distance(x,y,shot.x,shot.y) < 20
      return shot.collide = true if @dead
    end
  end

  def fire?(projectile)
    if rand(1000) < 1
      build projectile unless @dead or @obstructed
    end
  end

  def draw 
    @image.draw_rot(@x, @y, 1, @angle)
  end

  private

  def build projectile
    shot = Dispatcher.dispatch(Projectile.new){ projectile }
    shot.setup @window
    shot.x, shot.y = @x, @y + 15
    @shots_fired << shot
  end

end
