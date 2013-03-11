class Orders

  def initialize
    @order_hash = {}
  end

  def add order
    @order_hash = @order_hash.merge(order)
  end

  def act_on order
    @order_hash[order]
  end

end
