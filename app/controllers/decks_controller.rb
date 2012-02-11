class DecksController < ApplicationController
  before_filter :build_deck_box
  def index
  end

  def new
    @deck = @box.new_deck
  end

  def create
    @deck = @box.new_deck(params[:deck])
    @deck.publish
    redirect_to root_path, notice: 'Successfully created new deck.'
  end
  def build_deck_box
    @box = THE_BOX
  end
end
