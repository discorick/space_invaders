Dir.glob('lib/core/dispatchers/*types.rb'){|file| require File.expand_path(file)}

class Dispatcher
  extend ShipTypes
  extend ProjectileTypes

  def self.dispatch(space_object, &attributes)
    @space_object = space_object
    self.send(attributes.call) if block_given?
    @space_object
  end

end
