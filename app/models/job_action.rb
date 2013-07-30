class JobAction < ActiveRecord::Base
  belongs_to :job
  belongs_to :job_status
  
  ACTIONS = ["Applied", "Phone", "Video", "Technical Phone", "Test", "Coding", "In-person", "Exercise", "Code Review", "Offer"]
end
