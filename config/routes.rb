Rails.application.routes.draw do
  devise_for :users

  resources :postings do
    resources :post_comments, module: :postings
  end
end
