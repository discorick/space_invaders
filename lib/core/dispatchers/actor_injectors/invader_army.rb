module ArmyContainer

  attr_accessor :x,:y, :increment_x, :increment_y, :timer, :flags

  def setup invader_army, window
    @x , @y , @angle = 125, 175, 0.0
    @direction = [:move_right, :move_left]
    @increment_x, @increment_y = 25, 0 

    @switch = [false, true]
    @flags = {:reverse => false,
              :all_dead => :do_nothing}

    @window = window
    @timer = Timer.new
    @invader_army = invader_army
    @speed = 10

    process_invaders
    place_invaders
    equip_invaders

    self
  end

  # Movement
  def move 
    @flags[:all_dead] = :next_level if @invader_army.size == 0
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
    @x -= -@speed
    @increment_x = -@speed
  end

  def move_right
    @x += @speed
    @increment_x = @speed
  end

  def flag flag
    @flags[flag] = true
  end

  # Setup

  private

  def process_invaders
    @invader_army.invaders.each do |group|
      invader_row = @invader_army.invaders.index(group)
      group.each do |invader|
        invader.setup @window, ("type#{invader_row + 1}").to_sym
      end
    end
  end

  def equip_invaders
    @invader_army.each do |invader|
      invader.weapon = Dispatcher.dispatch(Weapon.new)
      invader.weapon.change_to :laser_gun
    end
  end

  def place_invaders
    @invader_army.invaders.each do |group|
      invader_row = @invader_army.invaders.index(group)
      group.each do |invader|
        invader_index = group.index(invader)
        invader.index[0], invader.index[1] = invader_row, invader_index
        invader.x = ((invader_index + 1) * invader.offset_x) + @invader_army.x
        invader.y = (invader_row * invader.offset_y) + @invader_army.y
      end
    end
  end
end
