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
    end
  end
end
