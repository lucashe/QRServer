class Api::V1::SessionsController < Devise::SessionsController

  skip_before_filter :authenticate_user_from_token!, :only => [:create]
  before_filter :ensure_params_exist

  #before_filter :validate_auth_token, :except => [:create, :destroy]
  include ApiHelper
  #include Devise::Controllers::Helpers

  respond_to :json
  
  def create

    #build_resource
    resource = User.find_for_database_authentication(:email => params[:user][:email])
    return failure unless resource

    if resource.valid_password?(params[:user][:password])
      sign_in :user, resource
      render :json => {:success => true, :auth_token => resource.authentication_token,:email => resource.email,
        :message => "Log in successfully"}
    return
    end

    failure
  end

  def destroy

    resource = User.find_for_database_authentication(:authentication_token=>params[:user_token])
    sign_out resource
    
    #Expire token 
    resource.reset_authentication_token!
    resource.save
  
    render :status => 200, :json => {:success => true, :message => "Log out successfully"}
  end

  protected

  def ensure_params_exist

    # If the post don't set: Content-Type: application/json, then need to use decode function below
    #req = ActiveSupport::JSON.decode(request.body)
    #puts req["user"]

    return unless params[:user].blank?
    render :json => {:success => false, :message => "Missing credentials"}, :status => 422
  end

  def failure
    render json: { :success => false, :message => "Invalid log in" }, :status => :unauthorized
  end

end