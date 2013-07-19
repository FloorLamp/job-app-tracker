class CreateCompanies < ActiveRecord::Migration
  def change
    create_table :companies do |t|
      t.string :name
      t.string :website_url
      t.string :icon_url
      t.references :job_action, index: true

      t.timestamps
    end
  end
end
