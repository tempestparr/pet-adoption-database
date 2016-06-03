Rails.application.routes.draw do
  devise_for :users
  resources :businesses
  resources :breeds
  resources :donations
  resources :pets
  resources :images
  resources :saved_pets
  
  devise_scope :user do
  get "/login" => "devise/sessions#new"
  end
  
  devise_scope :user do
  get "/register" => "devise/registrations#new"
  end
  
  get 'users' => 'users#index'
  
  # static pages
  root 'pages#home'
  get 'about' => 'pages#about'
  get 'contact' => 'pages#contact'


  # business pages
  post 'businesses' => 'businesses#new'
  get 'new_business' => 'businesses#new'
  get 'business' => 'businesses#index'
  
  # breed pages
  post 'breeds' => 'breeds#new'
  get 'new_breed' => 'breeds#new'
  get 'breeds' => 'breeds#index'
  
  # donations pages
  post 'donations' => 'donations#new'
  get 'new_donation' => 'donations#new'
  get 'donations' => 'donations#index'
  
  # pets pages
  post 'pets' => 'pets#new'
  get 'new_pet' => 'pets#new'
  get 'pets' => 'pets#index'
  
  # images pages
  post 'images' => 'images#new'
  get 'new_image' => 'images#new'
  get 'images' => 'images#index'
  
  # saved_pets pages
  post 'saved_pets' => 'saved_pets#new'
  get 'new_saved_pets' => 'saved_pets#new'
  get 'saved_pets' => 'saved_pets#userIndex'
  
  # appointments pages
  post 'appointments' => 'appointments#create'
  get 'appointments' => 'appointments#new'
  get 'apps' => 'appointments#index'
  
  
end
