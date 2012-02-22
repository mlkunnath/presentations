When /^I follow the link to add a new slide to a deck$/ do
  within(:css, 'li.deck') do
    click_link_or_button "Add a New Slide"
  end
end

Then /^I can add a new slide with content$/ do |contents|
  fill_in 'Content', :with => contents
end

Then /^the decks first slide should have content$/ do |content|
  @deck.slides.first.content.should == content
end
