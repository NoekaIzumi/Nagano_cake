Rails.application.routes.draw do

 root to: "public/homes#top"


get 'items' => 'public/items#index'

 namespace :admin do
   resources :items
   resources :customers
   get 'admin/orders/:id' => 'admin/orders#show'
 end

 namespace :customer do
   resources :customers
   resources :cart_items
   resources :orders
 end

  # 顧客用
# URL /customers/sign_in ...
devise_for :customers, skip: [:passwords],controllers: {
  registrations: "public/registrations",
  sessions: "public/sessions"
}

# 管理者用
# URL /admin/sign_in ...
devise_for :admin, skip: [:registrations, :passwords],controllers: {
  sessions: "admin/sessions",
}

 get 'public/home/about' , to: 'homes#about' , as: 'about'
 get 'admin'=> 'admin/homes#top'
 get '/customers/current_customer' => 'public/customers#show'
 get '/customers/current_customer/edit' => 'public/customers#edit'


  # 退会確認画面
 get  '/customers/check' => 'customers#check'
 # 論理削除用のルーティング
 get '/customers/confirm_withdraw' => 'public/customers#confirm_withdraw'
 patch  '/customers/withdraw' => 'public/customers#withdraw'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
