Rails.application.routes.draw do
  devise_for :users
  resources :pins
  root to: "pins#index"

  resources :pins do
    put 'like', to: 'pins#upvote'
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
