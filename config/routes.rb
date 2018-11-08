Rails.application.routes.draw do
  post '/', to: "movies#search", as: 'search'
  root to: "movies#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
