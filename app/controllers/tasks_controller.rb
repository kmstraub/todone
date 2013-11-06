class TasksController < ApplicationController
	def index
		@task = Task.new
		@tasks = Task.all
	end

	def create
		@task = Task.new(task_params)
		if @task.save!
			flash[:info] = "Added task: #{@task.name}"
			
		redirect_to tasks_path
		end
	end

	def destroy
		@task = Task.find(params[:id])
		@task.destroy
		flash[:info] = "Done"

		redirect_to tasks_path
	end



	private

	def task_params
			params.require(:task).permit(:name)
	end

end