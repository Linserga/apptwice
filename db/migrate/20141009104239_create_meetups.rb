class CreateMeetups < ActiveRecord::Migration
  def change
    create_table :meetups do |t|
      t.string :name
      t.text :description
      t.string :address
      t.string :city
      t.string :state
      t.string :zip
      t.datetime :starts_at
      t.datetime :ends_at

      t.timestamps
    end
  end
end
