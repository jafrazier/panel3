Rails.application.routes.draw do
  root 'sessions#new'
  resources :students
  resources :instructors
  resources :courses do
    delete 'terminate' => 'cohorts#destroy'
  end

  resources :cohorts do
    delete 'terminate' => 'cohorts#destroy'
  end

  get 'cohorts/new'
  get 'cohorts/show'
  get 'cohorts/edit'
  get 'cohorts/index'
  get 'courses/new'
  get 'courses/show'
  get 'courses/edit'
  get 'courses/index'
  get '/signup' => 'instructors#new'
  post 'login' => 'sessions#create'
  delete 'logout' => 'sessions#destroy'
  get 'instructors/show'
  get 'instructors/edit'
  get 'instructors/index'
  get 'students/new'
  get 'students/show'
  get 'students/edit'
  get 'students/index'
  get 'pages/home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
