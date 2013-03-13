class Orders

  def initialize
    @order_hash = {}
  end

  def add order
    @order_hash = @order_hash.merge(order)
  end

  def execute order
    @order_hash[order].call
  end

end
