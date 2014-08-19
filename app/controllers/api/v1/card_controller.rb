class Api::V1::CardController < ApplicationController

  respond_to :json
  def index

    @user_cards = current_user.cards

    respond_to do |format|
      format.html
      format.xml  { render :xml => @user_cards }
      format.json { render :json => @user_cards.to_json(:include => {:card_template => { only: [:title,:desc,:frontImageURL, :backImageURL]}})}
    end
  end

end
