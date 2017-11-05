class ApplicationController < ActionController::API
  before_action :authenticate

  private
  def authenticate
    check_request_header || check_access_token
  end

  def authentication_header
    request.headers['Authentication']
  end

  def check_request_header
    token_of_header = authentication_header

    if token_of_header == nil || token_of_header.empty?
      @msg = 'requrie authentication header...'
      render 'error', formats: 'json', handlers: 'jbuilder', status: 401
    end
  end

  def check_access_token
    token = authentication_header
    access_token = AccessToken.find(token)

    if access_token == nil || access_token.expired?
      @msg = 'invalid authentication token...'
      render 'error', formats: 'json', handlers: 'jbuilder', status: 401
      return
    end

    access_token.update_last_access!
    @user_id = access_token.user_id
  end

end
