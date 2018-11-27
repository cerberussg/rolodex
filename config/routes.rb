Rails.application.routes.draw do

  get 'dashboard/index'
  get 'home/index'
  devise_for :users, path: 'auth', controllers: { registrations: :custom_registrations },path_names: { sign_in: 'login', sign_out: 'logout', sign_up: 'register' }

  resources :contacts, except: [:show] do
    get 'autocomplete', on: :collection
  end

  post '/groups', to: 'groups#create'
  get '/dashboard', to: 'dashboard#index'
  root 'home#index'
end
