Rails.application.routes.draw do

 devise_for :customers, skip: [:passwords],controllers: {
  registrations: "customer/registrations",
  sessions: "customer/sessions"
}

# 管理者用
# URL /admin/sign_in ...
devise_for :admin, skip: [:registrations, :passwords],controllers: {
  sessions: "admin/sessions",
}

 root  "public/homes#top"

 namespace :admin do
   resources :items
   resources :customers
   resources :orders,only: [:show]
 end

 namespace :customer do
   resources :customers
   resources :cart_items, only: [:index, :create, :destroy,:update] do
     member do
       patch 'increase'
       patch 'decrease'
     end
   end
   resources :orders do
     member do
     post 'confirm'
   end
  end
   resources :items,only: [:index, :show]
 end

  # 顧客用
# URL /customers/sign_in ...


 get 'public/home/about' , to: 'public/homes#about' , as: 'about'
 get 'admin'=> 'admin/homes#top'

 get '/customers/sign_in' => 'customer/sessions#new'
 get '/customers/sign_up' => 'customer/registration#new'

 #カート内商品全削除
 delete '/customer/cart_items' => 'customer/cart_items#destroy_all'

#注文情報確認
 get '/customers/orders/confirm'=> 'customer/orders#confirm'
 post '/customers/orders/confirm'=> 'customer/orders#confirm'

 #注文完了画面
 get '/customers/orders/thanks' => 'customer/orders#thanks'

  # 退会確認画面
 get  '/customers/check' => 'customers#check'
 # 論理削除用のルーティング
 get '/customers/confirm_withdraw' => 'customer/customers#confirm_withdraw'
 patch  '/customers/withdraw' => 'customer/customers#withdraw'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
