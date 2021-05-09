class TasksController < ApplicationController

    def new
        @task = Task.new
    end   

    def create
        @task = Task.create task_create_params

        if @task.valid?
            redirect_to tasks_path
        else
            flash[:errors] = @tasks.error.full_messages
            redirect_to new_task_path
        end        
    end    

    private

    def task_create_params
        params.require(:task).permit(:title, :description, :begins_at, :deadline, :state)
    end    
end
