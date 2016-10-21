Rails.application.routes.draw do
  resources :qr_codes
  resources :participants
  resources :events
  post '/events/:id/generate', to: 'events#generate'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :participants

  resource :participants do
    post :import, on: :member
  end

end
