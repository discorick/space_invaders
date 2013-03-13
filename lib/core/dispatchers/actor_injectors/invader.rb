module Invader

  attr_accessor :x, :y, :shots_fired

  def setup window, type
   @height = @width = 1
   @x = @y = @angle = 0.0
   @invader_types = {:type1 => Constants::SpaceCraft::INVADER1,
                     :type2 => Constants::SpaceCraft::INVADER2,
                     :type3 => Constants::SpaceCraft::INVADER3}
   @image = Gosu::Image.new(window, @invader_types[type], false)
   @shots_fired = []
  end

  def hits_border?
    result = false
    result = true if @x == 0 or @x == 800
    result
  end

  def draw 
    @image.draw_rot(@x, @y, 1, @angle)
  end

end
