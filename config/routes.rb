Fedexday::Application.routes.draw do
  resources :subscriptions
  resources :posts do
    resources :comments
  end
  
  resources :comments

  root :to => 'posts#index'
end
