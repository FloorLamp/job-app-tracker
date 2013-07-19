class RemoveJobActionIdFromCompany < ActiveRecord::Migration
  def change
    change_table :companies do |t|
      t.remove_references :job_action
      t.references :job, index: true
    end
  end
end
