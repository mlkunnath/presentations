require 'active_record'
class Deck < ActiveRecord::Base
  attr_reader :slides
  attr_writer :slide_maker
  attr_accessor :deck_box
  has_many :slides

  def initialize(*)
    @slides = []
    super
  end

  def publish
    deck_box.add_deck(self)
  end

  def add_slide(slide)
    slides << slide
  end

  def new_slide
    slide_maker.call.tap do |slide|
      slide.deck = self
    end
  end

  private
  def slide_maker
    @slide_maker ||= Slide.public_method(:new)
  end
end
