

class CustomersController < ApplicationController
  protect_from_forgery with: :null_session

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
