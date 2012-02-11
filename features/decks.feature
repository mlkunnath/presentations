Feature: Decks
  As a Speaker
  In order to give presentations
  I need to manage slide decks

  Scenario: Add a New Slide Deck
    Given I am on the home page
    When  I follow the link to create a new slide deck
    Then  I can add a new slide deck titled "Deck 1"
    Then  I should see the deck titled "Deck 1"
