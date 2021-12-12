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

#ルートパスの設定
root :to => 'homes#top'
#Aboutのルートを設定
get 'about' => 'homes#about'
#会員側マイページのルート設定
get 'customers/mypage' => 'customers#mypage'
#会員側マイページ編集画面のルート設定
resources :customers, only: [:edit, :update]
#会員側退会処理画面のルート　参考資料：https://qiita.com/__Wata16__/items/9e05596afb671e540365
# 退会確認画面
  get '/customers/:id/unsubscribe' => 'customers#unsubscribe', as: 'unsubscribe'
  # 論理削除用のルーティング
  patch '/customers/:id/withdrawal' => 'customers#withdrawal', as: 'withdrawal'


namespace :admin do
    resources :genres, only: [:index, :create, :edit, :update]
    resources :items
    resources :customers
    root :to => 'homes#top'
    resources :order, only: [:show]
  end

end
