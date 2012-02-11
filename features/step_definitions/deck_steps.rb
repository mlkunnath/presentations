When /^I follow the link to create a new slide deck$/ do
  click_link_or_button 'Add a New Slide Deck'
end

Then /^I can add a new slide deck titled "([^"]*)"$/ do |deck_title|
  fill_in 'Title', :with => deck_title
  click_link_or_button 'Save'
end

Then /^I should see the deck titled "([^"]*)"$/ do |deck_title|
  within find(:css, 'li.deck') do
    page.should have_text deck_title 
  end
end
