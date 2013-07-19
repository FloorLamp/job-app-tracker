class JobStatus < ActiveRecord::Base
  has_many :job_actions
end
