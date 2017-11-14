class V1::LoginController < ApplicationController
  skip_before_action :authenticate

  def login
    login = Login.create(login_id: params[:user], password: params[:password])

    if login.error?
      @msg = login.error
      render 'v1/error', formats: 'json', handlers: 'jbuilder', status: login.status
      return
    end

    @access_token = create_access_token(login.user_id)
    render 'success', formats: 'json', handlers: 'jbuilder'
  end

  private

  def create_access_token(user_id)
    access_token = AccessToken.create(user_id)
    access_token.save
    access_token
  end

end
