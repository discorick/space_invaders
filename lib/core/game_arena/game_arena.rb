class GameArena < Gosu::Window
  
  def initialize
    super 800, 600, false
    self.caption = "Space Invaders"
    @background_image = Gosu::Image.new(self, Constants::Environment::BACKGROUND, true)
    init_space_objects 
  end

  def update 

    @space_engine.process_shots
    @space_engine.invaders_unobstruct_clear_shots

    Keys.ship_bindings(self).each do |binding, command|
      @player_ship.send(command) if button_down? binding  
    end

    @invader_army.timer.run_every(50){@space_engine.move_invaders}
    @space_engine.invaders_fire 

  end

  def draw
    @invader_army.invaders.each{|group| group.each do |invader| 
      invader.draw unless invader.dead
      invader.shots_fired.each{|sf| sf.draw}
    end}
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
    @player_ship.shots_fired << @space_engine.player_shot if id == Gosu::KbSpace
  end

end

