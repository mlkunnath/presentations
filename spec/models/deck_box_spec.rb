require 'minitest/autorun'
require 'ostruct'
require_relative '../../app/models/deck_box'

describe DeckBox do
  subject{ DeckBox.new }
  it "has an empty deck list" do
    subject.decks.must_be_empty 
  end
  describe "#new_deck" do
    let(:new_deck){ OpenStruct.new }
    before do
      subject.deck_maker = ->{ new_deck }
    end
    it "returns a new deck" do
      subject.new_deck.must_equal new_deck
    end

    it "sets the decks deckbox reference to itself" do
      subject.new_deck.deck_box.must_equal subject
    end
  end

  describe "#add_deck" do
    it "adds the deck to deck list" do
      entry = Object.new
      subject.add_deck(entry)
      subject.decks.must_include entry
    end
  end
end
