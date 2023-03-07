Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: "public/registrations",
    sessions: "public/sessions",
    passwords: 'users/passwords'
  }


   devise_for :admin,skip:[:registrations,:passwords],controllers: {
    sessions: "admin/sessions"
  }


  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#guest_sign_in'
   end

  get "search" => "searches#search"

  scope module:'public' do
    resources:users,only:[:index,:show,:edit,:update] do
      member do
        get :favorites
      end
    end
    get 'users/unsubscribe'
    get 'users/withdraw'
  end
  scope module:'public' do
    resources:dictionaries do
      resource :favorites
      resources:comments,only:[:create,:index,:destroy]
      resources:details
    end
  end

  namespace :admin do
    resources:users,only:[:index,:show,:edit,:update]
  end

  namespace :admin do
    resources:comments,only:[:index,:show,:destroy]
  end

  namespace :admin do
    get '/' => 'homes#top',as: :homes
  end

  scope module:'public' do
    root to:'homes#top'
  end


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
