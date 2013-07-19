class Job < ActiveRecord::Base
  has_many :job_actions, dependent: :destroy
  
  has_one :company, dependent: :destroy, autosave: true
  accepts_nested_attributes_for :company, allow_destroy: true
  
  def last_action_date
    self.job_actions.length > 0 && self.job_actions.last.date? ? self.job_actions.last.date : nil
  end
  
  def last_status
    self.job_actions.length > 0 && self.job_actions.last.job_status ? self.job_actions.last.job_status.name : nil
  end
end
