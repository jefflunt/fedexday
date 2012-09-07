require File.expand_path(File.join(File.dirname(__FILE__), "..", "support", "paths"))

Given /^these Ideas:$/ do |table|
  table.rows.each do |column_data|
    FactoryGirl.create(:idea, :title => column_data[0], :body => column_data[1])
  end
end

Then /^there should be (\d+) Ideas? scratched out$/ do |scratched_ideas_total|
  Idea.where(:scratched => true).count.should == scratched_ideas_total.to_i
end

When /^I scratch out "([^"]*)"$/ do |idea_title|
  idea = Idea.find_by_title(idea_title)
  idea.update_attribute(:scratched, true)
end
