class CustomersController < ApplicationController
  def index
    @cust = Customer.find(:all)

    respond_to do |format|
      format.html
      format.xml  { render :xml => @cust }
      format.json { render :json => @cust}
    end

  end

  def create

  end

end
