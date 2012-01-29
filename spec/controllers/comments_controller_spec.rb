require 'spec_helper'

describe CommentsController do
  before(:all) do
    @central_idea = Factory.create(:idea)
  end

  it "should accept valid comments" do
    lambda {
      post :create, :comment => { :body => "I am not a number, I am a free man!", :idea_id => @central_idea.id }
    }.should change(Comment, :count).by(1)
  end
  
  it "should reject comments that are missing a body" do
    lambda {
      post :create, :comment => { :idea_id => @central_idea.id }
    }.should_not change(Comment, :count)
  end
end
