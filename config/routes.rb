Presentear::Application.routes.draw do
  root to: 'events#new'
  
  get '/:token' => 'events#show', as: "show_event"
  
  scope '/:token', :as => "event" do
    resources :ideas, only: [:create]
  end
  
  resources :events, only: [:new, :create] 
end
