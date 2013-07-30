class Job < ActiveRecord::Base
  has_many :job_actions, dependent: :destroy
  
  has_one :company, dependent: :destroy, autosave: true
  accepts_nested_attributes_for :company, allow_destroy: true
  belongs_to :job_status
  
  def last_action_date
    if self.job_actions.length > 0 
      self.job_actions.last.date
    else
      nil
    end
  end
  
  def last_action_name
    if self.job_actions.length > 0 
      self.job_actions.last.name
    else
      nil
    end
  end
  
  def last_status
    @last_status = 
    if self.job_status
      self.job_status.name
    else
      if self.job_actions.length > 0 && self.job_actions.last.job_status
        self.job_actions.last.job_status.name
      else
        nil
      end
    end
  end
  
  def is_done?
    ["Failed", "Declined", "Cancelled"].include?(self.last_status)
  end
  
  def like_color
    self.like_level ||= 0
    if self.like_level > 0
      base = 100
      rb = (255 - self.like_level / 5.to_f * (255 - base)).to_i
      "rgb(#{rb},255,#{rb})"
    elsif self.like_level < 0
      base = 150
      gb = (255 + self.like_level / 5.to_f * (255 - base)).to_i
      "rgb(255,#{gb},#{gb})"
    else
      'rgb(255,255,255)'
    end
  end
end
