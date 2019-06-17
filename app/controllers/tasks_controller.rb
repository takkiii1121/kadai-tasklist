class TasksController < ApplicationController
    before_action :set_task, only: [:show, :edit, :update, :destroy]
    before_action :require_user_logged_in, only: [:new, :index, :show, :edit]
    before_action :correct_user, only: [:edit, :show, :update, :destroy]
    
    def index
        if logged_in?
            @task = current_user.tasks.build
            @tasks = current_user.tasks.order(id: :desc).page(params[:page])
        end
    end
    
    def show
        # @task = Task.find(params[:id])
        # set_task
    end
    
    def new
        @task = Task.new
    end
    
    def create
        @task = current_user.tasks.build(task_params)
        
        if @task.save
            flash[:success] = 'Taskが正常に保存されました'
            redirect_to root_url
        else
            @tasks = current_user.tasks.order(id: :desc).page(params[:page])
            flash.now[:danger] = 'Taskが保存されませんでした'
            render :new
        end
    end
    
    def edit
        # @task = Task.find(params[:id])
        # set_task
    end
    
    def update
        # @task = Task.find(params[:id])
        # set_task
        
        if @task.update(task_params)
            flash[:success] = 'Taskは正常に保存されました'
            redirect_to @task
        else
            flash.now[:danger] = 'Taskは保存されませんでした'
            render :edit
        end
    end
    
    def destroy
        # @task = Task.find(params[:id])
        # set_task
        @task.destroy
        
        flash[:success] = 'Taskは正常に削除されました'
        redirect_to tasks_url
    end


 private
    def set_task
        @task = Task.find(params[:id])
    end
    
    def task_params
        params.require(:task).permit(:content, :status)
    end
    
    def correct_user
        @task = current_user.tasks.find_by(id: params[:id])
        unless @task
            redirect_to root_url
        end
    end
end
