module V1
  class SampleController < ApplicationController
    def index
      render 'index', formats: 'json', handlers: 'jbuilder'
    end

    def post
      @sample_model = SampleModel.create(msg: params[:msg], path: params[:path], method: params[:method])
      render 'post', formats: 'json', handlers: 'jbuilder', status: @sample_model.status
    end

    def access_token
      user_id = params[:user_id]
      @access_token = AccessToken.create(user_id)
      @access_token.save!
      render 'access_token', formats: 'json', handlers: 'jbuilder'
    end

  end
end
