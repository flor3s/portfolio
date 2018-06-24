Rails.application.routes.draw do
  devise_for :users
  resources :projects, except: [:show]
  get 'rails-projects', to: 'projects#rails'
  get 'project/:id', to: 'projects#show', as: 'project_show'
  get 'about', to: 'pages#about'
  get 'contact', to: 'pages#contact'
  
  resources :blogs do 
  	member do
  		get :toggle_status
  	end
  end

  root to: 'pages#home'
end
