require 'spec_helper'

describe EndorsementsController do
  before(:all) do
    @central_idea = Factory.create(:idea)
  end
  
  before (:each) do
    @fresh_endorsement = Factory.create(:endorsement, :idea_id => @central_idea.id)
  end

  it "should accept valid endorsements" do
    lambda {
      post :create, :endorsement => { :name => "John Doe", :idea_id => @central_idea.id }
    }.should change(Endorsement, :count).by(1)
  end
  
  it "should reject endorsements that are missing a name" do
    lambda {
      post :create, :endorsement => { :idea_id => @central_idea.id }
    }.should_not change(Endorsement, :count)
  end
  
  it "should allow you to destroy endorsements" do
    lambda {
      delete :destroy, :id => @fresh_endorsement.id
    }.should change(Endorsement, :count).by(-1)
  end
end
