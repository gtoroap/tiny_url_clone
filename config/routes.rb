Rails.application.routes.draw do
  resources :urls, only: [:index, :new, :create, :show]

  get '/:slug', to: 'urls#short', as: :short
  get '/:slug/details', to: 'urls#details', as: :details

  root to: 'urls#new'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
