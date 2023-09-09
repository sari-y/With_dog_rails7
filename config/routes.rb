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
    get 'users/my_page' => 'users#show'
    get 'users/information/edit' => 'users#edit'
    patch 'users/information' => 'users#update'
    get 'users/confirm_withdraw' => 'users#confirm_withdraw'
    delete 'users/withdraw' => 'users#withdraw'



    resources :reviews
    resources :review_comments, only: [:create, :update, :destroy]
    resources :review_favorites, only: [:create, :destroy]


  end



  namespace :admin do
    get '/' => 'homes#top'

    resources :reviews, only: [:index, :show, :destroy]
    resources :users, only: [:index, :show, :destroy]
    resources :facility_categories, only: [:index, :create, :update, :destroy]
    resources :review_comments, only: [:destroy]

  end




  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
