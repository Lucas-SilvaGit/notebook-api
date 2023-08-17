Rails.application.routes.draw do
  resources :kinds
  
  resources :contacts do
    resource :kind, only: [:show]
  end
end
