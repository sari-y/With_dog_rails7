Rails.application.routes.draw do
  
devise_for :user,skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}


devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
}


  scope module: :public do
    get '/' => 'homes#top'
    get '/about' => 'homes#about'
    
    resources :reviews
    resources :users, only: [:show, :edit, :update]
    
    
  end
  
  
  
  namespace :admin do
    get '/' => 'homes#top'
    
    resources :reviews, except: [:new, :create]
    resources :users, except: [:new, :create, :destroy]
    resources :facility_categories, except: [:new, :show, :destroy]
    
  end
  
  
  
  
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
