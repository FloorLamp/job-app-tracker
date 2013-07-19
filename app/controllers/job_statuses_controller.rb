class JobStatusesController < ApplicationController
  def index
    @job_statuses = JobStatus.all
  end
  
  def create
    @job_status = JobStatus.new(params.require(:job_status).permit(:name, :color))
    
    if @job_status.save
      redirect_to 'index'
    else
      render 'index'
    end
  end
  
  def update
    @job_status = JobStatus.find(params[:id])
    
    if @job_status.update(params[:job_status].permit(:name, :color))
      redirect_to 'index'
    else
      render 'index'
    end
  end
  
  def destroy
    @job_status = JobStatus.find(params[:id])
    @job_status.destroy
   
    redirect_to 'index'
  end
end
