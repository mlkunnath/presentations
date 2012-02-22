class Slide
  extend ActiveModel::Naming
  include ActiveModel::Conversion
  attr_accessor :deck, :content
  def persisted? ; false ; end
end
