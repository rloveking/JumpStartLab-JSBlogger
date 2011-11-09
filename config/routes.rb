JSBlogger::Application.routes.draw do
  get "tags/index"
  get "tags/show"
  get "comments/index"
  get "comments/create"
  get "comments/destroy"

  resources :articles
  resources :comments
  resources :tags
end
