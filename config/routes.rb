Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :recycling_centers

  root 'recycling_centers#index'
  post 'recycling_centers/search' => 'recycling_centers#search', as: :recycling_centers_search
end
