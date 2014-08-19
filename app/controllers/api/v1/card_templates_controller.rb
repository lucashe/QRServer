class Api::V1::CardTemplatesController < ApplicationController

  skip_before_filter :authenticate_user_from_header_token!
  
  def index
    @card_templates = CardTemplate.all

    respond_to do |format|
      format.html
      format.xml  { render :xml => @card_templates }
      format.json { render :json => @card_templates}
    end

  end
end
