module ArmyContainer

  attr_accessor :x,:y, :increment_x, :increment_y, :timer

  def setup
    @x = @y = @angle = 0.0
    @direction = [:move_right, :move_left]
    @increment_x, @increment_y = 25, 0 

    @switch = [false, true]
    @flags = {:reverse => false}

    @timer = Timer.new
    self
  end

  def move 
    @increment_y = 0
    self.send(@direction[0]) unless @flags[:reverse]
    reverse if @flags[:reverse]
  end

  def move_down
    @y = @increment_y = 25   
    @increment_x = 0
  end

  def reverse
    @direction = @direction.reverse
    move_down 
    @flags[:reverse] = false
  end

  def move_left
    @x -= 25
    @increment_x = -25
  end

  def move_right
    @x += 25
    @increment_x = 25
  end

  def flag flag
    @flags[flag] = true
  end

end
