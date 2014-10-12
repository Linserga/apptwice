class ChangeProfileTable < ActiveRecord::Migration
  def change
  	rename_column :profiles, :avatar_file_name, :avatar
  end
end
