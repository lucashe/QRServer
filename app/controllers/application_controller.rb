class ApplicationController < ActionController::Base

  # Authenticate only JSON requests
  before_filter :authenticate_user_from_header_token!

  # Authenticate normal users (excluding JSON requests)
  before_filter :authenticate_user!, :unless => Proc.new { |c| c.request.format == 'application/json' }

  private
  def authenticate_user_from_header_token!

    # Only authenticate JSON requests
    return unless params[:format] == "json"

    authStr = request.headers["Authorization"]

    user_email = authStr.split(':')[0]
    user_token = authStr.split(':')[1]
    
    params[:header_email] = user_email
    params[:header_token] = user_token

    user       = user_email && user_token && User.find_by_email(user_email)

    # Notice how we use Devise.secure_compare to compare the token
    # in the database with the token given in the params, mitigating
    # timing attacks.
    if user && Devise.secure_compare(user.authentication_token, user_token)
      sign_in user, store: false
    else
      respond_to do |format|
        format.html { puts "No Token Access"}
        format.json { render json: { :success => false, :info => "Invalid user or token" }, :status => :unauthorized}
      end
    end

  end

# def authenticate_user_from_token!
#
# # Only authenticate JSON requests
# return unless params[:format] == "json"
#
# user_presense = params[:user].presence
# if user_presense
# user_email = params[:user][:email].presence
# end
#
# user       = user_presense && user_email && User.find_by_email(user_email)
#
# # Notice how we use Devise.secure_compare to compare the token
# # in the database with the token given in the params, mitigating
# # timing attacks.
# if user && Devise.secure_compare(user.authentication_token, params[:user][:auth_token])
# sign_in user, store: false
# else
# respond_to do |format|
# format.html { puts "No Token Access"}
# format.json { render json: { :success => false, :message => "Invalid user or token" }, :status => :unauthorized}
# end
# end
#
# end

end
