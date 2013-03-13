require 'spec_helper'

describe Orders do
  context "When Creating and Receiving Orders" do

    before(:each) do
      @orders = Orders.new
    end

    it "\n - Adds Orders" do
      @orders.add "Shape Up!" => "Do More Push Ups"
    end

    it "\n - Executes the Order" do
      @hash = {"Shape Up!" => lambda{"Do More Push Ups"}}
      @orders.add @hash
      @orders.execute( "Shape Up!" ).should === "Do More Push Ups" 
    end

  end
end
