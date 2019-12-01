Rails.application.routes.draw do
  devise_for :users
  devise_scope :user do
    get '/signout', to: 'user/sessions#destroy', as: :signout
  end
  root to: 'home#index'
  namespace :api do
    namespace :v1 do
      resources :todos, defaults: { format: :json }
    end
  end
end
