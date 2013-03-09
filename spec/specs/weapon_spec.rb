require 'spec_helper'

describe Weapon do
  context 'When a Weapon is created' do

    before(:all) do
      @weapon = Weapon.new
    end

    it 'Has a weapon type' do
      @weapon.type.should == :cannon
    end

    it 'Has an Armory' do
      @weapon.armory[:laser_gun].should == :laser 
    end

  end
   
  context 'A  Weapon' do

    before(:each) do
      @weapon = Weapon.new
    end

    it 'Fires the weapon' do
      @weapon.type.should == :cannon
      @weapon.fire
    end

    it 'Adds a Weapon Type' do
      @weapon.add :lightsaber => :laser_slash
      @weapon.armory[:lightsaber].should == :laser_slash
    end

    it 'Changes to a Weapon' do
      @weapon.change_to :laser_gun
    end

  end
end
