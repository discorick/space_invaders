class GameArena < Gosu::Window
  
  def initialize
    super 800, 600, false
    self.caption = "Space Invaders"
    @background_image = Gosu::Image.new(self, Constants::Environment::BACKGROUND, true)
    init_space_objects 
  end

  def update 

    Keys.ship_bindings(self).each do |binding, command|
      @player_ship.send(command) if button_down? binding  
    end

    @player_ship.shots_fired.each do |sf| 
      sf.alive?
      @player_ship.shots_fired.delete sf unless sf.alive
      sf.move if sf.alive
    end

    @invader_army.timer.run_every(50){@space_engine.move_invaders}

  end

  def draw
    @invader_army.invaders.each{|group| group.each{|invader| invader.draw}}
    @player_ship.shots_fired.each{|sf| sf.draw}
    @player_ship.draw
    @background_image.draw(0,0,0)
  end

  def init_space_objects
    @space_engine = SpaceEngine.new
    @space_engine.window = self
    @player_ship = @space_engine.setup_player 
    @invader_army = @space_engine.setup_invader_army 
  end

  def button_down(id)
    close if id == Gosu::KbEscape
    @player_ship.shots_fired << @space_engine.player_fire if id == Gosu::KbSpace
  end

end

