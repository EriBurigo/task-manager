class TasksController < ApplicationController
  before_action :set_task, only: [:edit, :update, :destroy, :complete, :archive]

  # Exibe as tarefas, com filtro opcional de alarme
  def index
    @tasks = Task.where(archived: false)
    if params[:with_alarm].present?
      @tasks = @tasks.where.not(alarm_time: nil).page(params[:page]).per(5)
    else
      @tasks = @tasks.page(params[:page]).per(5)
    end
  end

  # Cria uma nova tarefa
  def new
    @task = Task.new
  end

  # Salva a nova tarefa no banco de dados
  def create
    @task = Task.new(task_params)
    if @task.save
      redirect_to tasks_path, notice: 'Tarefa criada com sucesso.'
    else
      render :new
    end
  end

  # Edita uma tarefa existente
  def edit
  end

  # Atualiza uma tarefa existente
  def update
    if @task.update(task_params)
      redirect_to tasks_path, notice: 'Tarefa atualizada com sucesso.'
    else
      render :edit
    end
  end


  def complete
    @task = Task.find(params[:id])
    
    # Atualiza a tarefa, definindo completed como true ou false
    if @task.update(completed: params[:task][:completed])
      redirect_to tasks_path, notice: 'Tarefa marcada como concluída.'
    else
      redirect_to tasks_path, alert: 'Erro ao concluir a tarefa.'
    end
  end

  # Arquiva uma tarefa
  def archive
    if @task.update(status: :archived)
      redirect_to tasks_path, notice: 'Tarefa arquivada com sucesso!'
    else
      redirect_to tasks_path, alert: 'Erro ao arquivar a tarefa.'
    end
  end

  # Exclui uma tarefa
  def destroy
    @task.destroy
    redirect_to tasks_path, notice: 'Tarefa excluída com sucesso.'
  end

  private

  # Carrega a tarefa com base no ID
  def set_task
    @task = Task.find(params[:id])
  end

  # Permite apenas os parâmetros seguros
  def task_params
    params.require(:task).permit(:name, :alarm_time, :completed)
  end
end
