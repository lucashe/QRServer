class Api::V1::RegistrationsController < Devise::RegistrationsController

  skip_before_filter :authenticate_user_from_header_token!, :only => [:create]

  respond_to :json
  def create

    build_resource sign_up_params

    if resource.save

      sign_in :user, resource

      render :status => 200,
           :json => { :success => true,
                      :info => "Registered",
                      :data => { :user => resource,
                                 :auth_token => current_user.authentication_token } }

    else
      render :status => :unprocessable_entity,
             :json => { :success => false,
                        :info => resource.errors,
                        :data => {} }
    end
  end

  def sign_up_params
    params.require(:user).permit(:email, :password)
  end

end