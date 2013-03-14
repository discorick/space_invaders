require 'spec_helper'

describe Timer do 
  context "When Timing Cycles" do


    before(:each) do
      @timer = Timer.new 
      @array = []
    end

    it "Delays executing until cycle is complete" do
     
      32.times do
        @timer.run_every 30 do
          @array[0] = "Hello"
        end
      end

      @array.length.should == 1
      @array[0].should === "Hello"

    end

  end
end
