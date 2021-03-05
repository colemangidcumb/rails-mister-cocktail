Rails.application.routes.draw do
  root to: 'cocktails#index'
  resources :cocktails, only: %w[index new show create] do
    resources :doses, only: %w[new create]
  end
  delete 'doses/:id', to: 'doses#destroy', as: :destroy
end
