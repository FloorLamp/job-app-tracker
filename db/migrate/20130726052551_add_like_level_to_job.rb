class AddLikeLevelToJob < ActiveRecord::Migration
  def change
    add_column :jobs, :like_level, :int
  end
end
