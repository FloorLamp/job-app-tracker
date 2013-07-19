class AddDateToJobAction < ActiveRecord::Migration
  def change
    add_column :job_actions, :date, :date
  end
end
