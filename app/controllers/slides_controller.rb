class SlidesController < ApplicationController
  before_filter :build_deck_box
  def new
    @deck = @box.find_deck(params[:deck_id])
    @slide = @deck.new_slide
  end
  def create
    @deck = @box.find_deck(params[:deck_id])
    @slide = @deck.new_slide(params[:slide])
    if @slide.valid?
      @deck.add_slide(@slide)
      redirect_to deck_path(@deck)
    else
      render :new
    end
  end
  def build_deck_box
    @box = THE_BOX
  end
end
