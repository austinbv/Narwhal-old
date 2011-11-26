Narwhal::Application.routes.draw do
  get "sessions/create"

  get "sessions/destroy"

  resources :users

  match '/survey' => redirect('https://docs.google.com/spreadsheet/viewform?formkey=dC1aa01TbkszUHAySmdobTgydkx3NWc6MQ')
  match '/signout' => 'sessions#destroy', :as => 'signout'
  resources :presentations do
    resources :slides do
      resources :shapes
    end
  end
  match '/signin' => redirect('/auth/google_oauth2/'), as: 'signin'
  get '/auth/:provider/callback', :to => 'sessions#create'
  get ':id', as: "short_presentation", :to => "presentations#show"
  root :to => "users#index"
end
