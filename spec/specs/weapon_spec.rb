require 'spec_helper'

describe Weapon do
  context 'When a Weapon is created' do

    before(:all) do
      @weapon = Weapon.new
    end

    it 'Has a weapon type' do
      @weapon.type.should == :bullet 
    end

  end
   
  context 'A created Weapon can' do

    it 'Fires the weapon' do
      @weapon = Weapon.new
      @weapon.fire.should be true
    end

  end
end
