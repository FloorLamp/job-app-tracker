class ChangeJobStatusOnJobs < ActiveRecord::Migration
  def change
    change_table :jobs do |t|
        t.references :job_status
    end
  end
end
