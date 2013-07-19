class AddRemoteToJobs < ActiveRecord::Migration
  def change
    add_column :jobs, :remote, :boolean
  end
end
