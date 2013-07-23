class JobStatusesController < ApplicationController
  def index
    @job_statuses = JobStatus.all
  end
  
  def create
    @job_status = JobStatus.create(params.require(:job_status).permit(:name, :color))
    
    redirect_to job_statuses_path
  end
  
  def update
    @job_status = JobStatus.find(params[:id])
    @job_status.update(params[:job_status].permit(:name, :color))
    
    redirect_to job_statuses_path
  end
  
  def destroy
    @job_status = JobStatus.find(params[:id])
    @job_status.destroy
   
    redirect_to job_statuses_path
  end
end
