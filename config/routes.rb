Rails.application.routes.draw do
  # Rota principal
  root "tasks#index"

  # Rotas para tarefas
  resources :tasks, except: :show do
    collection do
      get :archived
    end

    member do
      patch :complete
      patch :archive  # Adiciona essa rota para arquivar uma tarefa específica
    end

    resources :tasks do
      patch :complete, on: :member
    end    
  end
end
