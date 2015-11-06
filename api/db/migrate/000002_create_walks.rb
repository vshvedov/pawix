class CreateWalks < ActiveRecord::Migration
  def change
    create_table :walks do |t|
      t.integer :user_id
      t.integer :duration

      t.timestamps null: false
    end
  end
end
