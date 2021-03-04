Rails.application.routes.draw do
  resources :cocktails, only: %w[index new show create] do
    resources :doses, only: %w[new create]
  end
  resources :doses, only: ['destroy']
end
