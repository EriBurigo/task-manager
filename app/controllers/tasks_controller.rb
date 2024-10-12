class TasksController < ApplicationController
    before_action :set_task, only: [:show, :edit, :update, :destroy]

    def complete
      @task = Task.find(params[:id])
      @task.update(completed: params[:task][:completed])
      redirect_to tasks_path
    end    

    def arquive
        @task = Task.find(params[:id])
        @task.update(arquived: true)
        redirect_to tasks_path, notice: 'Tarefa arquivada com sucesso'
    end

    def archived
      @tasks = Task.where(arquived: true)
    end    

    def index
      if params[:with_alarm].present?
        @tasks = Task.where.not(alarm_time: nil).page(params[:page]).per(5)
      else
        @tasks = Task.page(params[:page]).per(5)
      end
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
    @task = Task.find(params[:id])
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
    @task = Task.find(params[:id])
  end

  def task_params
    params.require(:task).permit(:name)
    params.require(:task).permit(:name, :alarm_time)
  end

end
