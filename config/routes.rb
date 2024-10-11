Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
    # Define a rota principal para listar todas as tarefas
    root "tasks#index"

    # Define rotas RESTful para o recurso 'tasks'
  resources :tasks, except: :show

  resources :tasks do
    collection do
      get :archived
    end
  end  
end
