Rails.application.routes.draw do

  get 'comments/create'

  get 'comments/add_comment'

  get '/new' => 'recipes#new'
  get '/show_recipe' => 'recipes#show'
  get '/edit' => 'recipes#edit'
  get '/results' => 'recipes#show_recipes'
  get '/home' => 'home#homepage'
  root 'home#homepage'
  get '/help' => 'home#help'
  get '/administration' => 'home#administration'
  get '/add_comment' => 'comments#create'


  authenticated do
    get '/forgot_password' => 'devise/passwords#edit'
  end

  unauthenticated do
    get 'forgot_password', :to => 'devise/sessions#new'
  end

  as :user do
    get '/log_in', :to => 'devise/sessions#new'
    get '/sign_up' => 'devise/registrations#new'
  end
  resources :recipes
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
