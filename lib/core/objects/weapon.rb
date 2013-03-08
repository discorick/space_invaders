class Weapon
  attr_accessor :type

  def initialize
    @type = :bullet
  end

  def fire
    true
  end

end
