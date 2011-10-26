# encoding: utf-8

require 'spec_helper'

describe Event do
  describe "token" do
    it "is generated on save" do
      obj = Factory.build(:event)
      obj.token.should be_nil
      obj.save
      obj.token.should_not be_nil
    end
  
    it "is name-based" do
      Factory(:event, gifted: "João da Silva").token.should == 'joao-da-silva'
    end
    
    it "is unique" do
      tokens = []
      4.times { tokens << Factory(:event, gifted: "Fulano").token }
      tokens.uniq.count.should == 4
    end
  end
  
  it "requires gifted" do
    subject.should have(1).error_on(:gifted)
  end
  
  it "requires type" do
    subject.should have(1).error_on(:event_type)
  end
  
  describe "limit date" do
    it "requires limit date" do
      subject.should have(1).error_on(:limit_date)
    end
    
    it "must be in the future or today" do
      event = Factory.build(:expired_event)
      event.should have(1).error_on(:base)
    end
  end
  
  it "should display if event is still active" do
    event = Factory(:event)    
    event.active?.should == true
  end
  
  # it "should be able to filter only events that didn't occur yet" do
  #   Factory(:event)    
  #   Factory(:expired_event)
  #   Event.active.count.should == 1 
  # end
  
end
