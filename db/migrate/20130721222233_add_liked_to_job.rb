class AddLikedToJob < ActiveRecord::Migration
  def change
    add_column :jobs, :liked, :boolean
    add_column :jobs, :inbound, :boolean
  end
end
