require 'spec_helper'

describe DecksController do
  let!(:deck_box){ DeckBox.new }
  describe 'GET new' do
    let(:new_deck){ stub.as_null_object }
    before do
      DeckBox.stub(:new).and_return deck_box
      deck_box.deck_maker = ->{ new_deck }
      get :new
    end
    it 'builds and assigns a new deck from the deck box' do
      assigns[:deck].should == new_deck
    end
  end

  describe "POST create" do
    let(:stub_deck){ stub.as_null_object }
    before do
      DeckBox.stub(:new).and_return deck_box
    end
    it 'builds a new deck from params' do
      deck_box.should_receive(:new_deck).with({'foo' => 'bar'}).
        and_return stub_deck
      post :create, deck: {"foo" => "bar"}
    end
    it 'publishs the deck' do
      deck_box.deck_maker = ->{ stub_deck }
      stub_deck.should_receive(:publish)
      post :create, deck: {"foo" => "bar"}
    end
    it 'redirects to the root path' do
      post :create, deck: {}
      response.should redirect_to '/'
    end
    it 'has a success notice' do
      post :create, deck: {}
      flash[:notice].should == 'Successfully created new deck.'
    end
  end
end
