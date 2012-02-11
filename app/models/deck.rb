class Deck
  extend ActiveModel::Naming
  include ActiveModel::Conversion
  attr_accessor :title, :deck_box
  def initialize(attrs={})
    attrs.each do |k,v| send("#{k}=", v) end
  end
  def publish
    deck_box.add_deck(self)
  end

  def persisted?
    false
  end
end
