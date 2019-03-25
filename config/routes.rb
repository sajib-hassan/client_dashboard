Rails.application.routes.draw do
  resources :consultants
  resources :clients
  resources :contractors
  resources :partner_companies
  resources :employees
  resources :companies
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
