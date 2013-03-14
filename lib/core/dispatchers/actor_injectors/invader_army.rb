module ArmyContainer

  attr_accessor :x,:y, :increment, :timer

  def setup
    @x = @y = @angle = 0.0
    @direction = [:move_right, :move_left]
    @increment = 25
    @flags = {:reverse => false}
    @timer = Timer.new
    self
  end

  def move
    self.send(@direction[0])
  end

  def reverse
    @direction = @direction.reverse
    @flags[:reverse] = false
  end

  def move_left
    @x -= 25
    @increment = -25
  end

  def move_right
    @x += 25
    @increment = 25
  end

  def flag flag
    @flags[flag] = true
  end

  def check_flags
    @flags.each do |command, bool|
      self.send(command) if bool
    end
  end

end
