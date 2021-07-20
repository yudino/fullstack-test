Rails.application.routes.draw do

  root 'feedbacks#new'

  get '/feedbacks(?s=:s)(?o=:o&d=:d)(?p=:p&n=:n)', to: 'feedbacks#index'
  get '/feedbacks(?s=:s)(&o=:o&d=:d)(&p=:p&n=:n)', to: 'feedbacks#index'
  resources :feedbacks

 
end
