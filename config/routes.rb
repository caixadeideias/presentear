Presentear::Application.routes.draw do
  root to: 'events#new'
  
  get '/:token' => 'events#show', as: "show_event"
  resources :events, only: [:show, :new, :create]

end
