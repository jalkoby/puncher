Rails.application.routes.draw do
  resources :bonus_codes, only: :index do
    get :validate, on: :collection
  end
end
