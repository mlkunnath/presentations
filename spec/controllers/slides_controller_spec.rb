require 'spec_helper'

describe SlidesController do
  let(:deck) { stub.as_null_object }
  let(:new_slide) { stub.as_null_object }
  describe "GET new" do
    before do
      THE_BOX.stub(:find_deck).with('1').
        and_return deck 
      deck.stub(:new_slide).and_return new_slide
      get :new, :deck_id => 1
    end
    it { assigns[:deck].should == deck }
    it { assigns[:slide].should == new_slide }
  end
  describe "POST create" do
    before do
      THE_BOX.stub(:find_deck).with('1').
        and_return deck 
      deck.stub(:new_slide).and_return new_slide
      post :create, :deck_id => 1
    end
    it { assigns[:deck].should == deck }
    it 'builds a new slide from params' do
      deck.should_receive(:new_slide).
        with({'foo' => 'bar'}).and_return new_slide
      post :create, :deck_id => 1, :slide => {'foo' => 'bar'}
    end
    context 'slide is valid' do
      before do
        new_slide.stub(:valid?){ true }
      end
      it 'redirects to the decks page' do
        response.should redirect_to deck_path(deck)
      end
      it 'adds the slide to the deck' do
        deck.should_receive(:add_slide).with(new_slide)
        post :create, :deck_id => 1, :slide => {'foo' => 'bar'}
      end
    end
    context 'slide is not valid' do
      before do
        new_slide.stub(:valid?){ false }
        post :create, :deck_id => 1, :slide => {'foo' => 'bar'}
      end
      it 're-renders the new action' do
        response.should render_template 'new'
      end
    end
  end
end
