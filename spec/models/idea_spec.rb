require 'spec_helper'

describe Idea do
  it "should properly classify long expired ideas" do
    fresh_idea = FactoryGirl.create(:idea)
    week_old_scratched_idea = FactoryGirl.create(:idea, :updated_at => 1.1.weeks.ago, :scratched => true)
  
    month_old_active_idea = FactoryGirl.create(:idea)
    month_old_scratched_idea = FactoryGirl.create(:idea, :updated_at => 1.month.ago, :scratched => true)
    
    year_old_active_idea = FactoryGirl.create(:idea, :updated_at => 1.year.ago)
    year_old_scratched_idea = FactoryGirl.create(:idea, :updated_at => 1.year.ago, :scratched => true)
    
    Idea.long_expired.include?(fresh_idea).should                == false
    Idea.long_expired.include?(week_old_scratched_idea).should   == true
    
    Idea.long_expired.include?(month_old_active_idea).should     == false
    Idea.long_expired.include?(month_old_scratched_idea).should  == true
    
    Idea.long_expired.include?(year_old_active_idea).should      == true
    Idea.long_expired.include?(year_old_scratched_idea).should   == true
  end
end

