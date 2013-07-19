class RemoveJobStatusFromJob < ActiveRecord::Migration
  def change
    change_table :job_statuses do |t|
      t.remove_references(:job)
      t.references :job_action, index: true
    end
  end
end
