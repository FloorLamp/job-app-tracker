class JobsController < ApplicationController
  def index
    all_jobs = Job.all.sort_by{ |j| [j.last_action_date ? j.last_action_date : Date.new(9999)] }.reverse!
    @failed_jobs = all_jobs.select{ |j| j.is_done? || (j.last_action_name == "Applied" && j.last_action_date < Date.today - 14) }
    @passed_jobs = (all_jobs - @failed_jobs).select{ |j| j.last_action_name == "Offer" }
    @pending_jobs = all_jobs.select{ |j| j.last_action_name == "Applied" && j.last_action_date >= Date.today - 14}
    @in_progress_jobs = all_jobs - @passed_jobs - @failed_jobs - @pending_jobs
  end
  
  def new
    @job = Job.new
    @job.build_company
    @company_favicon = nil
  end
  
  def create
    @job = Job.create(params[:job].permit(:position, :remote, :source, :inbound, :like_level, :notes, :job_status_id, company_attributes: [:id, :name, :website_url, :icon_url]))
    
    redirect_to @job
  end
  
  def show
    @job = Job.find(params[:id])
    @company = @job.company
    @company_favicon = @job.company ? @job.company.icon_url : nil
  end
  
  def edit
  end
  
  def update
    @job = Job.find(params[:id])    
    @job.update(params.require(:job).permit(:position, :remote, :source, :inbound, :like_level, :notes, :job_status_id, company_attributes: [:id, :name, :website_url, :icon_url]))
    
    redirect_to @job
  end
  
  def destroy
    @job = Job.find(params[:id])
    @job.destroy
   
    redirect_to jobs_path
  end
end
