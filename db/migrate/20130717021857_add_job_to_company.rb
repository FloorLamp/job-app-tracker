class AddJobToCompany < ActiveRecord::Migration
  def change
    add_reference :companies, :job, index: true
    
    remove_reference :jobs, :company
  end
end
