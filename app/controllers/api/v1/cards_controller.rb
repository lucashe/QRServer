class Api::V1::CardsController < ApplicationController

  respond_to :json
  def index

    @user_cards = current_user.cards

    respond_to do |format|
      format.html
      format.xml  { render :xml => @user_cards }
      format.json { render :json => @user_cards.to_json(:include => {:card_template => { only: [:title,:desc,:frontImageURL, :backImageURL]}})}
    end
  end

  def create

    @card = Card.new(card_params)

    respond_to do |format|
      if @card.save
        render :json => @card.to_json(:include => {:card_template => { only: [:title,:desc,:frontImageURL, :backImageURL]}}),status: :created
      else
        render json: @card.errors, status: :unprocessable_entity
      end
    end

  end

  def card_params
    params.require(:card).permit(:card_template_id)
  end

end
