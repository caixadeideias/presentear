# encoding: utf-8

require 'spec_helper'

describe Idea do

  it "should not save an empty idea" do
    expect {
      Idea.create
    }.not_to change { Idea.count}      
  end
    
end