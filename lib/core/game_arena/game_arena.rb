require_relative 'keys.rb'

class GameArena < Gosu::Window
  
  def initialize
    super 800, 600, false
    self.caption = "Space Invaders"
    @background_image = Gosu::Image.new(self, Constants::Environment::BACKGROUND, true)
    init_space_objects 
    @timer = []
  end

  def update 

    Keys.ship_bindings(self).each do |binding, command|
      @player_ship.send(command) if button_down? binding  
    end

    @space_objects << @space_engine.player_fire(self) if button_down? Gosu::KbSpace

    puts @space_objects.length

    @space_objects.each do |so| 
      so.alive = false if so.y <= 0 
      @space_objects.delete so unless so.alive
      so.move
    end

  end

  def draw
    @space_objects.each{|space_object| space_object.draw}
    @player_ship.draw
    @background_image.draw(0,0,0)
  end

  def init_space_objects
    @space_engine = SpaceEngine.new
    @player_ship = @space_engine.setup_player self
    @space_objects = []
  end

  def button_down(id)
    if id == Gosu::KbEscape
      close
    end
  end

end

