Rails.application.routes.draw do
  root to: 'home#account'

  get 'account', to: 'home#account', as: 'account'
  get 'summary', to: 'home#summary', as: 'summary'

  devise_for :customers
end
