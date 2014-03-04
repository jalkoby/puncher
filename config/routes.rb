Rails.application.routes.draw do
  root :to => 'bonus_codes#index'

  get 'bonus_codes/validate' => 'bonus_codes#validate', :as => :validate_bonus
end
