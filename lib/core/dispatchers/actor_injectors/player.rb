module Player
  attr_accessor :x, :y, :shots_fired, :dead

  def setup(window)
    @image = Gosu::Image.new(window, Constants::SpaceCraft::PLAYER, false)
    @x = @y = @angle = 0.0
    @shots_fired = []
    @dead = false
  end

  def each(&block)
    @shots_fired.each do |sf|
      yield sf
    end
  end

  def is_hit? projectile
    projectile.each do |shot|
      @dead = true if Gosu::distance(x,y,shot.x,shot.y) < 20
      #return shot.collide = true if @dead
    end
  end

  def move_left
    @x -= 5
  end

  def move_right
    @x += 5 
  end

  def draw
    @image.draw_rot(@x, @y, 1, @angle)
  end
end
