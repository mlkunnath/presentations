require_relative '../spec_helper_lite'
require 'activerecord-nulldb-adapter'
require_relative '../../app/models/deck'

describe Deck do
  include SpecHelpers
  before do
    setup_nulldb
  end
  after do
    teardown_nulldb
  end
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

  describe "#add_slide" do
    it "adds the slide to the list of slides" do
      entry = Object.new
      subject.add_slide(entry)
      subject.slides.must_include entry
    end
  end
  describe "#new_slide" do
    let(:new_slide){ OpenStruct.new }
    before do
      subject.slide_maker = ->{ new_slide }
    end
    it "returns a new slide" do
      subject.new_slide.must_equal new_slide
    end
    it "sets the slides deck reference to itself" do
      subject.new_slide.deck.must_equal subject
    end
  end
end
