Rails.application.routes.draw do
  resources :topics, only: [:index, :show]
  devise_for :users, path: '', path_names: { sign_in: 'login', sign_out: 'logout', sign_up: 'register' }
  resources :projects, except: [:show] do
    put :sort, on: :collection
  end
  get 'rails-projects', to: 'projects#rails'
  get 'project/:id', to: 'projects#show', as: 'project_show'
  get 'about', to: 'pages#about'
  get 'contact', to: 'pages#contact'
  
  resources :blogs do 
  	member do
  		get :toggle_status
  	end
  end

  mount ActionCable.server => '/cable'

  root to: 'pages#home'
end