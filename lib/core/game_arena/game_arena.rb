class GameArena < Gosu::Window
  
  def initialize
    super 800, 600, false
    self.caption = "Space Invaders"
    @level_font = Gosu::Font.new(self, Gosu::default_font_name, 20)
    @background_image = Gosu::Image.new(self, Constants::Environment::BACKGROUND, true)
    init_space_objects 
  end

  def update 
    refresh_space_objects

    unless @player_ship.dead #Work this condition out
      @space_engine.process_player_shots
      @space_engine.invaders_unobstruct_clear_shots

      Keys.ship_bindings(self).each do |binding, command|
        @player_ship.send(command) if button_down? binding  
      end

      @invader_army.each do |invader|
        @player_ship.is_hit? invader.shots_fired
      end

      @invader_army.timer.run_every(50 - (@space_engine.level * 5)){@space_engine.move_invaders}
      @space_engine.invaders_fire 
    end

    @space_engine.flag_global = @invader_army.flags[:all_dead]
    @space_engine.run_global_conditions

    @invader_army.each{|invader| invader.is_hit? @player_ship.shots_fired unless invader.dead}
    @space_engine.process_invader_shots

  end

  def draw
    unless @player_ship.dead
      @player_ship.shots_fired.each{|sf| sf.draw}
      @player_ship.draw
    end
    @invader_army.each do |invader| 
      invader.draw unless invader.dead
      invader.shots_fired.each{|sf| sf.draw}
    end
    @level_font.draw(" Level: #{@space_engine.level}", 10, 10, 10, 1.0, 1.0, 0xffffff00)
    @background_image.draw(0,0,0)
  end

  def init_space_objects
    @space_engine = SpaceEngine.new self
    @player_ship = @space_engine.setup_player 
  end

  def refresh_space_objects
    @invader_army = @space_engine.invader_army
  end

  def button_down(id)
    close if id == Gosu::KbEscape
    @player_ship.shots_fired << @space_engine.player_shot if id == Gosu::KbSpace
  end

end

