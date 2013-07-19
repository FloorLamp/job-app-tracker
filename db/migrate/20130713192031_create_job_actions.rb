class CreateJobActions < ActiveRecord::Migration
  def change
    create_table :job_actions do |t|
      t.string :name
      t.string :status

      t.timestamps
    end
  end
end
