class Api::RegistrationsController < Api::BaseController
 
  respond_to :json
  
  def create
 
    user = User.new(params[:user])
    
    if user.save
      render json: user.as_json(auth_token: user.authentication_token, email: user.email), status: :created
      return
    else

    end
    
  end
 
end