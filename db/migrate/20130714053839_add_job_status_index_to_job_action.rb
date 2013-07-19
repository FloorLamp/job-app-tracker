class AddJobStatusIndexToJobAction < ActiveRecord::Migration
  def change
      add_index :job_actions, :job_status_id
  end
end
