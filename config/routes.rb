Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'main_page#index'

  resources :ingredients do
    resources :products, only: [:index]
  end

  resources :subcategories do
    resources :products
  end

  resources :products do
    resources :opinions
  end

  resources :brands do
    resources :products
  end
end
