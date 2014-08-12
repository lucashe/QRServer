class Api::V1::SessionsController < Devise::SessionsController

  skip_before_filter :authenticate_user_from_token!, :only => [:create]
  before_filter :ensure_params_exist

  #before_filter :validate_auth_token, :except => [:create, :destroy]
  #include ApiHelper
  #include Devise::Controllers::Helpers

  respond_to :json
  def create

    #build_resource
    resource = User.find_for_database_authentication(:email => params[:user][:email])
    return failure unless resource

    if resource.valid_password?(params[:user][:password])
      sign_in :user, resource

      render :status => 200,
           :json => { :success => true,
                      :info => "Logged in successfully",
                      :data => { :user => resource,
                                 :auth_token => current_user.authentication_token } }
    return
    end

    failure
  end

  def destroy

    resource = User.find_for_database_authentication(:authentication_token=>params[:user][:auth_token])
    sign_out resource

    #Expire token
    resource.reset_authentication_token!
    resource.save

    render :status => 200,
           :json => { :success => true,
                :info => "Logged out successfully",
                :data => {} }
  end

  protected

  def ensure_params_exist

    # If the post don't set: Content-Type: application/json, then need to use decode function below
    #req = ActiveSupport::JSON.decode(request.body)
    #puts req["user"]

    return unless params[:user].blank?
    render :status => 422,
           :json => {:success => false,
                     :info => "Missing credentials" ,
                     :data => {}}
  end

  def failure
    render :status => :unauthorized,
            :json=> {:success => false,
                     :info => "Invalid credentials",
                     :data => {} }
  end

end