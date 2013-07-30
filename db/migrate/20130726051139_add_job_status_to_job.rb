class AddJobStatusToJob < ActiveRecord::Migration
  def change
    add_column :jobs, :job_status, :reference, index: true
  end
end
