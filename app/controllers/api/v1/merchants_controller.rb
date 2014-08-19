class Api::V1::MerchantsController < ApplicationController
  def index
    @merchants = Merchant.all

    respond_to do |format|
      format.html
      format.xml  { render :xml => @merchants }
      format.json { render :json => @merchants}
    end

  end

end
