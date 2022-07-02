Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :parks
    end
    namespace :v2 do
      resources :parks
    end
  end
end
