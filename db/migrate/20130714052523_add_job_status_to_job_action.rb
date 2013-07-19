class AddJobStatusToJobAction < ActiveRecord::Migration
  def change
    change_table :job_statuses do |t|
      t.remove_references :job_action
    end
    
    change_table :job_actions do |t|
      t.remove :status
      t.references :job_status
    end
  end
end
