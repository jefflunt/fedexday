require 'uri'
require File.expand_path(File.join(File.dirname(__FILE__), "..", "support", "paths"))

Given /^pending$/ do
  # Essentially allows marking an entire scenario as "pending", as opposed to just a single step
  # Useful when you have multiple tests failing, and you want to filter out a few, but still see
  # "Pending" in the cucumber results
  # Ref.: http://stackoverflow.com/questions/3064078/how-do-you-mark-a-cucumber-scenario-as-pending
  pending
end

When /^(?:|I )fill in "([^\"]*)" with "([^\"]*)"$/ do |field, value|
  fill_in(field, :with => value)
end

Then /^I should see "([^"]*)"$/ do |text|
  page.should have_content(text)
end

Then /^I should not see "([^"]*)"$/ do |arg1|
  page.should_not have_content(text)
end

Then /^I should see all of:$/ do |list_of_texts_to_see|
  list_of_texts_to_see.rows.each do |text|
    page.should have_content(text[0])
  end
end

Then /^I should see links with class "([^"]*)" in this order:$/ do |link_class, table|
  expected_order = table.rows.flatten
  actual_order = page.all("a.#{link_class}").collect(&:text)
  actual_order.should == expected_order
end

When /^(?:|I )follow "([^\"]*)"$/ do |link|
  click_link(link)
end

Given /^(?:|I )go to (.+)$/ do |page_name|
  visit path_to(page_name)
end

Then /^show me the page$/ do
  save_and_open_page
end

When /^(?:|I )press "([^\"]*)"$/ do |button|
  click_button(button)
end

Then /^debug$/ do
  debugger
end
