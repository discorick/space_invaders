require 'spec_helper'

describe Orders do
  context "When Creating and Receiving Orders" do

    before(:all) do
      @orders = Orders.new
    end

    it "\n - Adds Orders" do
      @orders.add "Shape Up!" => "Do More Push Ups"
    end

    it "\n - Returns Corresponding Action" do
      @orders.act_on( "Shape Up!" ).should === "Do More Push Ups"
    end

  end
end
