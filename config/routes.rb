Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'characters#new'
  resources :characters, only: [:new, :create, :destroy] do
    resource :game, only: :show, controller: 'characters/game'
  end
  resources :games, only: :update do
    resources :characters, only: :show, controller: 'games/characters'
  end
end
