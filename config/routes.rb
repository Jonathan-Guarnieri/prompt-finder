Rails.application.routes.draw do
  root to: 'prompts#index'
  get 'prompts', to: 'prompts#index'
end
