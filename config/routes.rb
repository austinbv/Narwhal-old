Narwhal::Application.routes.draw do
  match '/survey' => redirect('https://docs.google.com/spreadsheet/viewform?formkey=dC1aa01TbkszUHAySmdobTgydkx3NWc6MQ')
  resources :presentations do
    resources :slides do
      resources :shapes
    end
  end

  get ':id', as: "short_presentation", :to => "presentations#show"
  root :to => "presentations#index"
end
