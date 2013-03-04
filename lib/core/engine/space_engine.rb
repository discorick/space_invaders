class SpaceEngine

  def move(object)
    @object = object
    self
  end

  def to(posi)
    @object.position = posi
  end

end
