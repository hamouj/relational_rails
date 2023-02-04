Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get '/schools', to: 'schools#index'
  get '/schools/new', to: 'schools#new'
  post '/schools', to: 'schools#create'

  get '/schools/:id/edit', to: 'schools#edit'
  patch '/schools/:id', to: 'schools#update'
  get '/schools/:id', to: 'schools#show'

  get '/schools/:id/teachers', to: 'school_teachers#index'
  get '/schools/:id/teachers/new', to: 'school_teachers#new'
  post '/schools/:id/teachers', to: 'school_teachers#create'

  get '/teachers', to: 'teachers#index'
  get '/teachers/:id', to: 'teachers#show'
end
