Rails.application.routes.draw do
  root 'events#index'
  resources :participants
  resources :events
  post '/events/:id/generate', to: 'events#generate'
  post '/qr_codes/:uuid/checkin', to: 'qr_codes#checkin'
  get '/participants/import', to: 'participants#import'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :participants

  resource :participants do
    post :import, on: :member
  end

end
