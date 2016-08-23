class Api::V1::BaseController < ActionController::Base
  respond_to :json, :xml

  private
    def authenticate
      auth_token = request.headers['X-Auth-Token']
      @user = User.where(authentication_token: auth_token).first if auth_token
      unless @user
        head status: :unauthorized
        return false
      end
    end

    def check_if_admin
      head status: :forbidden unless @user.admin?
    end
end