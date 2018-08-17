Rails.application.routes.draw do
  root to: 'cocktails#index'
  resources :doses, only: [:destroy]
  resources :cocktails do
    resources :cocktail_tags, only: [:new, :create]
    resources :doses, only: [:create, :new]
  end
end
