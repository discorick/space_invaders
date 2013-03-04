require 'spec_helper'

describe InvaderArmy  do
  context 'When Creating an Invader Army' do

    before(:all) do
      @invader_army = InvaderArmy.new
    end

    it "\n - Contains Invaders" do
      @invader_army.invaders.length.should_not be nil
    end

  end
end
