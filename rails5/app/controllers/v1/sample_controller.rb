module V1
  class SampleController < ApplicationController
    def index
      render 'index', formats: 'json', handlers: 'jbuilder'
    end

    def redis
      render 'redis', formats: 'json', handlers: 'jbuilder'
    end
  end
end
