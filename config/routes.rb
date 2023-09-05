Rails.application.routes.draw do
  namespace :admin do
    get 'facility_categories/index'
    get 'facility_categories/edit'
    get 'users/index'
    get 'users/show'
    get 'users/edit'
    get 'reviews/index'
    get 'reviews/show'
    get 'homes/top'
  end
  namespace :public do
    get 'reviews/index'
    get 'reviews/new'
    get 'reviews/show'
    get 'reviews/edit'
    get 'users/show'
    get 'users/edit'
    get 'homes/top'
    get 'homes/about'
  end
  
devise_for :user,skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}


devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
}
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
