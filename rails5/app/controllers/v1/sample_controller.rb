class V1::SampleController < ApplicationController

  def index
    render 'index', formats: 'json', handlers: 'jbuilder'
  end

  def redis
    render 'redis', formats: 'json', handlers: 'jbuilder'
  end

end
