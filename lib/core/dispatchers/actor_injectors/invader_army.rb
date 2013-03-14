module ArmyContainer

  attr_accessor :x,:y, :increment_x, :increment_y, :timer

  def setup
    @x = @y = @angle = 0.0
    @direction = [:move_right, :move_left]
    @increment_x, @increment_y = 25, 0 
    @flags = {:reverse => false}
    @timer = Timer.new
    self
  end

  def move
    @max_right = @x + 450
    @increment_y = 25 if @x == 25 or @max_right == 775
    self.send(@direction[0])
  end

  def reverse
    @direction = @direction.reverse
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

  def check_flags
    @increment_y = 0
    @flags.each do |command, bool|
      self.send(command) if bool
    end
  end

end
