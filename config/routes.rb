Rails.application.routes.draw do
    root to: 'toppages#index'
    resources :tasks
    # get 'tasks/:id', to: 'tasks#show'
    # post 'tasks', to: 'tasks#create'
    # put 'tasks/id:', to: 'tasks#update'
    # delete 'tasks/id:', to: 'tasks#destroy'
    
    # get 'tasks', to: 'tasks#index'
    
    # get 'tasks/new', to: 'tasks#new'
    
    # get 'tasks/id:/edit' to: 'tasks#edit'
    
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
