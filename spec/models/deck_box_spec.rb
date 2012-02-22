require 'minitest/autorun'
require 'ostruct'
require_relative '../../app/models/deck_box'

describe DeckBox do
  let(:decks){ [] }
  subject{ DeckBox.new( ->{ decks}) } 
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

    it "accepts hash of options" do
      deck_maker = MiniTest::Mock.new
      deck_maker.expect(:call, new_deck, [{title: 'foo'}])
      subject.deck_maker = deck_maker
      subject.new_deck(title: 'foo')
      deck_maker.verify
    end
  end

  describe "#add_deck" do
    it "saves the deck to deck list" do
      entry = MiniTest::Mock.new 
      entry.expect(:save, true, [])
      subject.add_deck(entry)
    end
  end

  describe "find_deck" do
    it "calls the deck finder" do
      deck = Object.new
      deck_finder = MiniTest::Mock.new
      deck_finder.expect(:call, deck, [1])
      subject.deck_finder = deck_finder 
      subject.find_deck(1).must_equal deck
      deck_finder.verify
    end
  end
end
