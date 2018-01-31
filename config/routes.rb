Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "main_page#index"
  resources :ingredients do
    resources :products
  end

  resources :subcategories do
    resources :products
  end

  resources :products

  resources :brands do
    resources :products
  end
end
