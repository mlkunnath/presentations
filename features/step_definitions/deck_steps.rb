When /^I follow the link to create a new slide deck$/ do
  click_link_or_button 'Add a New Slide Deck'
end

Then /^I can add a new slide deck titled "([^"]*)"$/ do |deck_title|
  fill_in 'Title', :with => deck_title
  click_link_or_button 'Save'
end

Then /^I should see the deck titled "([^"]*)"$/ do |deck_title|
  within find(:css, 'li.deck') do
    page.should have_content deck_title 
  end
end

Given /^There is a deck in the deckbox named "([^"]*)"$/ do  |deck_name|
  @deck = THE_BOX.new_deck(title: deck_name)
  THE_BOX.add_deck(@deck)
end
