require 'spec_helper'

describe SpaceShip do

  context 'When Creating a New spaceship' do

    before(:all) do
      @spaceship = SpaceShip.new
    end

    it "\n - Has 1 Life" do
      @spaceship.lives.should == 1
    end

    it "\n - Has a Weapon" do
      @spaceship.weapon.should == :laser
    end

    it "\n - Has a Position" do
      @spaceship.position.should == [0,0]
    end

    it "\n - Has a Size" do
      @spaceship.size.should == [1,1]
    end

  end

  context 'When Setting up a Ship' do

    before(:all) do
      @spaceship = SpaceShip.new
    end

    it "\n - Can Add and Remove Lives" do
      @spaceship.add_life
      @spaceship.lives.should == 2
      @spaceship.remove_life
      @spaceship.lives.should == 1
    end

    it "\n - Can Change Weapons" do
      @spaceship.weapon = :cannon
      @spaceship.weapon.should == :cannon
    end

   it "\n - Can Change Position" do
     @spaceship.position = [1,1]
     @spaceship.position.should == [1,1]
   end

   it "\n - Can Change Size" do
     @spaceship.size = [2,2]
     @spaceship.size.should == [2,2]
   end

  end

end
