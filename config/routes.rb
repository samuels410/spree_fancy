Spree::Core::Engine.routes.draw do
  # Add your extension routes here
  resources :newsletters
  post 'news_letter' => 'newsletters#accept_recipient'
end
