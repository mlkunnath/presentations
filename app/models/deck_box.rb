class DeckBox
  attr_reader :decks
  attr_writer :deck_maker
  def initialize
    @decks = []
  end
  def new_deck
    deck_maker.call.tap do |deck|
      deck.deck_box = self
    end
  end
  def add_deck(deck)
    decks << deck
  end
  private
  def deck_maker
    @deck_maker ||= Deck.new
  end
end
