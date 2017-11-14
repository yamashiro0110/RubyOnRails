class V1::SampleController < ApplicationController
  def index
    render 'index', formats: 'json', handlers: 'jbuilder'
  end

  def post
    sample_model = SampleModel.create(msg: params[:msg], path: params[:path], method: params[:method])

    if sample_model.error?
      render 'v1/error', formats: 'json', handlers: 'jbuilder', status: sample_model.status
      return
    end

    @sample_model = sample_model
    render 'post', formats: 'json', handlers: 'jbuilder'
  end

  def access_token
    render 'access_token', formats: 'json', handlers: 'jbuilder'
  end

end
