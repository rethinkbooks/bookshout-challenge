module Api
  module V1
    class TasksController < ApplicationController
      before_action :authenticate_user!
      allow_oauth!  :only => [:index, :create]
      respond_to :json

      def index
        @tasks = Task.where(user_id: current_user.id)
        respond_with(@tasks)
      end

      def create
        @task = Task.new(task_params)
        @task.user_id = current_user.id
        @task.save
        render nothing: true
      end

      private

      def task_params
        params.require(:task).permit(:name)
      end
    end
  end
end
