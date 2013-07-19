class AddCompanyPositionSourceToJobs < ActiveRecord::Migration
  def change
    add_column :jobs, :company, :string
    add_column :jobs, :position, :string
    add_column :jobs, :source, :string
  end
end
