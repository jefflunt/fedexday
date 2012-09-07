require File.expand_path(File.join(File.dirname(__FILE__), "..", "support", "paths"))

Given /^these Endorsements on "([^"]*)":$/ do |idea_title, table|
  idea = Idea.find_by_title(idea_title)
  table.rows.each do |column_data|
    FactoryGirl.create(:endorsement, :name => column_data[0], :idea_id => idea.id)
  end
end

Then /^there should be (\d+) Endorsements? on "([^"]*)"$/ do |total_endorsements, idea_title|
  idea = Idea.find_by_title(idea_title)
  idea.endorsements.count.should == total_endorsements.to_i
end

