Narwhal::Application.routes.draw do

  resources :presentations do
    resources :slides do
      resources :shapes
    end
  end

  root :to => "presentations#index"
end
