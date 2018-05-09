Rails.application.routes.draw do
  get 'users/new'
  root "home_page#home"
  get  '/signup',  to: 'users#new'
end
