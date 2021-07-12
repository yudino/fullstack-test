Rails.application.routes.draw do

  root 'feedbacks#new'

  resources :feedbacks

 
end
