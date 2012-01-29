require File.expand_path(File.join(File.dirname(__FILE__), "..", "support", "paths"))

Given /^these Comments on "([^"]*)":$/ do |idea_title, table|
  idea = Idea.find_by_title(idea_title)
  table.rows.each do |column_data|
    Factory.create(:comment, :body => column_data[0], :idea_id => idea.id)
  end
end
