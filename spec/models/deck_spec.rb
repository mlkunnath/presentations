require 'minitest/autorun'
require_relative '../../app/models/deck'

describe Deck do
  let(:subject){ Deck.new }
  it 'supports reading and writing title' do
    subject.title = "The New Title"
    subject.title.must_equal "The New Title"
  end
  it 'supports reading and writing a deck box reference' do
    deck_box = Object.new
    subject.deck_box = deck_box
    subject.deck_box.must_equal deck_box
  end
  describe "#publish" do
    let(:deck_box){ MiniTest::Mock.new }
    before do
      subject.deck_box = deck_box
    end
    after do
      deck_box.verify
    end
    it "adds the deck to the deck box" do
      deck_box.expect(:add_deck, nil, [subject])
      subject.publish
    end
  end
end
