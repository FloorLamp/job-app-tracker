class AddJobRefToJobActions < ActiveRecord::Migration
  def change
    add_reference :job_actions, :job, index: true
  end
end
