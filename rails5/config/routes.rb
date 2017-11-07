Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  ['v1.0'].each {|version|
    scope version do
      get  'sample/get',    to: 'v1/sample#index'
      post 'sample/post',   to: 'v1/sample#post'
      post 'access_token',  to: 'v1/sample#access_token'
    end
  }

end
