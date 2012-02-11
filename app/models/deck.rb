class Deck
  attr_accessor :title, :deck_box
  def publish
    deck_box.add_deck(self)
  end
end
