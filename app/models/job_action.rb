class JobAction < ActiveRecord::Base
  belongs_to :job
  belongs_to :job_status
end
