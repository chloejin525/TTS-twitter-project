Rails.application.routes.draw do
  
  get 'tweet_tags' => 'epiccenter#tweet_tags'
  get 'home' => 'tweets#home'
  get 'show_user' => 'epiccenter#show_user'
  get 'now_following' => 'epiccenter#now_following'
  get 'unfollow' => 'epiccenter#unfollow'
  get 'feed' => 'epiccenter#feed'
  get 'explore' => 'tweets#explore'
  get 'hot_users' => 'epiccenter#hot_users'
  get 'hot_tags' => 'epiccenter#hot_tags'

  resources :tweets
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'tweets#home'
end
