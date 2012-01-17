Fedexday::Application.routes.draw do
  resources :ideas
  resources :endorsements
  resources :comments

  root :to => 'ideas#index'
end
