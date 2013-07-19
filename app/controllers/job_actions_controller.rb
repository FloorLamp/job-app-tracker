class JobActionsController < ApplicationController
  def create
    @job = Job.find(params[:job_id])
    @action = @job.job_actions.create(params[:job_action].permit(:date, :name, :job_status_id))
    
    redirect_to job_path(@job)
  end
  
  def update
    @job = Job.find(params[:job_id])
    @job_action = JobAction.find(params[:id])
    
    if @job_action.update(params[:job_action].permit(:date, :name, :job_status_id))
      redirect_to @job
    else
      render 'show'
    end
  end
  
  def destroy
    @job = Job.find(params[:job_id])
    @job_action = JobAction.find(params[:id])
    @job_action.destroy
   
    redirect_to @job
  end
end
