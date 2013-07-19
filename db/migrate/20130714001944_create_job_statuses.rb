class CreateJobStatuses < ActiveRecord::Migration
  def change
    create_table :job_statuses do |t|
      t.references :job, index: true
      t.string :name
      t.string :color

      t.timestamps
    end
  end
end
