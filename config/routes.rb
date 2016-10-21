Rails.application.routes.draw do
  resources :qr_codes
  resources :events
  resources :participants

  resource :participants do
    post :import, on: :member
  end
end
