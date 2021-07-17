Rails.application.routes.draw do

  root 'feedbacks#new'

  get '/feedbacks(?s=:s)(?o=:o&d=:d)(?p=:p&n=:n)(/:id)', to: 'feedbacks#show'
  resources :feedbacks

 
end
