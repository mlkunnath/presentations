require_relative '../spec_helper_lite'
require_relative '../../app/models/slide'

describe Slide do
  let(:deck){ Object.new }
  subject{ Slide.new }
  it 'supports writing the deck reference' do
    subject.deck = deck
    subject.deck.must_equal deck
  end
  it 'supports writing content' do
    subject.content = 'Content'
    subject.content.must_equal 'Content'
  end
end
