Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  ['v1.0'].each {|version|
    scope version do
      get 'sample',       to: 'v1/sample#index'
      get 'sample/redis', to: 'v1/sample#redis'
    end
  }

end
