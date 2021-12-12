Rails.application.routes.draw do

  devise_for :customers, controllers: {
  sessions:      'customers/sessions',
  passwords:     'customers/passwords',
  registrations: 'customers/registrations'
}

  devise_for :admins, controllers: {
  sessions:      'admins/sessions',
  passwords:     'admins/passwords',
  registrations: 'admins/registrations'
}

root :to => 'homes#top'
get 'about' => 'homes#about'
get 'customers/mypage' => 'customers#mypage'
get 'customers/mypage/edit/:id' => 'customers#edit', as: 'edit_customers_mypage'
patch 'customers/mypage' => 'customers#update', as: 'update_customers_mypage'


namespace :admin do
    resources :genres, only: [:index, :create, :edit, :update]
    resources :items
    resources :customers
    root :to => 'homes#top'
    resources :order, only: [:show]
  end

end
