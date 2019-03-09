Rails.application.routes.draw do
  root to: 'base#index'
  devise_for :users
  
  namespace :admin do
    root to: 'base#index', as: :root
    resources :users, only: [:index, :update]
    resources :products
  end

  resources :users, only: [] do
    collection do
      put :upgrade
    end
  end
end
