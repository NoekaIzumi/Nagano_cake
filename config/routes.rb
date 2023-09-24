Rails.application.routes.draw do

 root to: "homes#top"


get 'items' => 'public/items#index'

 namespace :admin do
   resources :items
   get 'items' => 'admin/items#index'
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

 get 'home/about' , to: 'homes#about' , as: 'about'



  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
