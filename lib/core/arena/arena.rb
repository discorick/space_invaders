require 'gosu'

class Arena < Gosu::Window
  
  def initialize
    super 800, 600, false
    self.caption = "Space Invaders"
  end

  def update

  end

  def draw

  end
end

window = Arena.new
window.show
