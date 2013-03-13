require 'spec_helper'

describe InvaderArmy  do
  context 'When Creating an Invader Army' do

    before(:all) do
      @invader_army = InvaderArmy.new
    end

    it "\n - Contains Invaders" do
      @invader_army.invaders.length.should_not be nil
    end

    it "\n - Adds Invaders" do
      @invader_army.add_invaders(20)
      @invader_army.invaders.length.should eql 20 
    end
    
    it "\n - Adds Invaders in Groups" do
      @invader_army.add_invader_group(0,10)
      @invader_army.invaders[0].length.should eql 10
      @invader_army.add_invader_group(1,10)
      @invader_army.invaders[1].length.should eql 10
    end

  end
end
