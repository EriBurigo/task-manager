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
            end
      end
end
