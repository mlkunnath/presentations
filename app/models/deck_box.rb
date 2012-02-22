require_relative './deck'
class DeckBox
  attr_writer :deck_maker, :deck_finder
  def initialize(deck_fetcher = Deck.public_method(:all))
    @deck_fetcher = deck_fetcher
  end
  def new_deck(*args)
    deck_maker.call(*args).tap do |deck|
      deck.deck_box = self
    end
  end
  def add_deck(deck)
    deck.save
  end
  def find_deck(deck_id)
    deck_finder.call(deck_id)
  end
  def decks
    @deck_fetcher.()
  end
  private
  def deck_maker
    @deck_maker ||= Deck.public_method(:new)
  end
  def deck_finder
    @deck_finder ||= Deck.public_method(:find)
  end
end
