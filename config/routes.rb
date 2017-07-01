Rails.application.routes.draw do

  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }

  resources :users do 
    resources :pins 
  end 
  
  resources :pins
  root to: "pins#index"


  resources :categories

  resources :pins do
    resources :comments
    member do
      put 'like', to: 'pins#upvote'
    end
  end

    get 'pins/:id/pin_data', to: 'pins#pin_data'


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
