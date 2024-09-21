class TasksController < ApplicationController
    before_action :set_task, only: [:show, :edit, :update, :destroy]

    def index
        @tasks = Task.all
      end

      def new
        @task = Task.new
      end

      def create
        @task = Task.new(task_params)
            if @task.save
                redirect_to tasks_path, notice: 'Tarefa criada com sucesso.'
            else
                render :new
            end
      end

      # GET /tasks/:id/edit
   def edit
   end

   # PATCH/PUT /tasks/:id
  def update
      # "Atualiza a tarefa existente com os parâmetros recebidos e redireciona se for bem-sucedido"
    if @task.update(task_params)
      redirect_to tasks_path, notice: 'Tarefa atualizada com sucesso.'
    else
      # "Renderiza o formulário de edição se a tarefa não for atualizada"
      render :edit
    end
  end

  # DELETE /tasks/:id
  # "Adiciona o método destroy para excluir uma tarefa existente"
  def destroy
    @task.destroy # "Exclui a tarefa do banco de dados"
    # "Redireciona para a lista de tarefas após a exclusão"
    redirect_to tasks_path, notice: 'Tarefa excluída com sucesso.'
  end

  private

  # "Adiciona o método set_task para carregar a tarefa com base no ID fornecido"
  def set_task
  end
end
