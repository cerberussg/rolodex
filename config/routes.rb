Rails.application.routes.draw do

  get 'contacts/index', as: 'contacts'
  get 'contacts/new', as: 'new_contact'
  post '/contacts/create', to: 'contacts#create'
  get 'contacts/:id/edit', to: 'contacts#edit', as: 'edit_contact'
  root 'contacts#index'
end
