class CreateMeetupsUsers < ActiveRecord::Migration
  def change
    create_table :meetups_users do |t|
      t.integer :user_id
      t.integer :meetup_id
    end
    add_index :meetups_users, [:user_id, :meetup_id]
  end
end
