require 'spec_helper'

describe IdeasController do
  before(:each) do
    @some_idea = Factory.create(:idea)
  end

  it "should allow access to the index action" do
    get :index
    response.should be_success
  end
  
  it "should allow you to show an idea" do
    get :show, :id => @some_idea.id
    response.should be_success
  end
  
  it "should allow you to get to the new idea page" do
    get :new
    response.should be_success
  end
  
  it "should allow you to edit an idea" do
    get :edit, :id => @some_idea.id
    response.should be_success
  end
  
  it "should allow you to create an idea" do
    lambda {
      post :create, :idea => { :title => "Some idea", :body => "Some idea I came up with." }
    }.should change(Idea, :count).by(1)
  end
  
  it "should reject a new idea that excludes either a title, or body" do
    lambda {
      post :create, :idea => { :title => "Some idea" }
    }.should_not change(Idea, :count)
    
    lambda {
      post :create, :idea => { :body => "Some idea I came up with." }
    }.should_not change(Idea, :count)
  end
  
  it "should allow you to update an idea" do
    lambda {
      put :update, :id => @some_idea.id, :idea => { :title => "My new title" }
      @some_idea.reload
    }.should change(@some_idea, :title).to("My new title")
  end
  
  it "should reject updates with an empty title or body" do
    lambda {
      put :update, :id => @some_idea.id, :idea => { :title => "" }
      @some_idea.reload
    }.should_not change(@some_idea, :title)
    
    lambda {
      put :update, :id => @some_idea.id, :idea => { :body => "" }
      @some_idea.reload
    }.should_not change(@some_idea, :body)
  end
  
  it "should allow you to scratch an idea" do
    lambda {
      request.env["HTTP_REFERER"] = ideas_path
      put :scratch, :id => @some_idea.id
      @some_idea.reload
    }.should change(@some_idea, :scratched)
  end
end
