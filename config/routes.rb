Rails.application.routes.draw do

 root  "public/homes#top"

 namespace :admin do
   resources :items
   resources :customers
   resources :orders
 end

 namespace :customer do
   resources :customers
   resources :cart_items
   resources :orders
   resources :items,only: [:index, :show]
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

 get 'public/home/about' , to: 'public/homes#about' , as: 'about'
 get 'admin'=> 'admin/homes#top'
 get '/customers/current_customer' => 'customer/customers#show'
 get '/customers/current_customer/edit' => 'customer/customers#edit'


  # 退会確認画面
 get  '/customers/check' => 'customers#check'
 # 論理削除用のルーティング
 get '/customers/confirm_withdraw' => 'public/customers#confirm_withdraw'
 patch  '/customers/withdraw' => 'public/customers#withdraw'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
