class RemoveJobIdFromCompany < ActiveRecord::Migration
  def change
    change_table :companies do |t|
      t.remove_references :job
    end
    
    change_table :jobs do |t|
      t.references :company, index: true
    end
  end
end
