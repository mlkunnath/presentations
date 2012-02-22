Feature: Slides
  As a Speaker
  In order to give presentations
  I want to add slides to a deck

  Scenario: Add a New Slide To A Deck
    Given There is a deck in the deckbox named "Test Deck"
    Given I am on the home page
    When  I follow the link to add a new slide to a deck
    Then  I can add a new slide with content
    """
      <h2> Heading </h2>
      <ul>
        <li> This is it
      </ul>
    """
    Then the decks first slide should have content
    """
      <h2> Heading </h2>
      <ul>
        <li> This is it
      </ul>
    """
