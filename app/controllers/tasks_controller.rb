class TasksController < ApplicationController

    def new
        @task = current_user.tasks.build
    end   

    def create
        
        @task = Task.new task_params
        @task.user = current_user

        if @task.save
            redirect_to root_path
        else
            flash[:errors] = @task.errors.full_messages
            redirect_to new_tasks_path
        end        
    end

    def update
        task = current_user.tasks.find_by_id(params[:id])
    
        if task.update_attributes task_params
            flash[:success] = ["State updated"]
        else
            flash[:errors] = task.errors.full_messages
        end 

        redirect_to root_path
    end    
    
    def edit
        @task = current_user.tasks.find_by_id(params[:id])
    end    

    private

    def task_params
        params.require(:task).permit(:title, :description, :begins_at, :deadline, :state)
    end    
end
