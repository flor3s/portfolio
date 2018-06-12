Rails.application.routes.draw do
  resources :projects
  
  get 'about', to: 'pages#about'
  get 'pages/contact'
  
  resources :blogs

  root to: 'pages#home'
=end
