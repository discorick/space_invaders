require_relative 'ship_types.rb'

class Dispatcher
  extend ShipTypes

  def self.dispatch(space_object, &attributes)
    @space_object = space_object
    self.send(attributes.call) if block_given?
    @space_object
  end

end
