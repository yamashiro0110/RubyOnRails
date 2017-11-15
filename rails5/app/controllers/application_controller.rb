class ApplicationController < ActionController::API
  before_action :authenticate

  rescue_from StandardError, with: :standard_error

  private

  # ***********************
  # error handler
  def standard_error(error)
    if error
      @msg = error.message
      render 'v1/error', formats: 'json', handlers: 'jbuilder', status: 500
    end
  end

  # ***********************
  # authentication
  def authenticate
    check_request_header || check_access_token
  end

  def authentication_header
    request.headers['Authentication']
  end

  def check_request_header
    if authentication_header.blank?
      @msg = 'requrie authentication header...'
      render 'v1/error', formats: 'json', handlers: 'jbuilder', status: 401
      return
    end
  end

  def check_access_token
    access_token = AccessToken.find_by(token: authentication_header)

    if access_token.nil? || access_token.expired?
      @msg = 'invalid authentication token...'
      render 'v1/error', formats: 'json', handlers: 'jbuilder', status: 401
      return
    end

    @access_token = access_token
  end

end
