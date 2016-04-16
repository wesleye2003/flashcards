class CreateRounds < ActiveRecord::Migration
  def change
      create_table :rounds do |t|

      t.integer :correct_first_try, default: 0
      t.integer :total_attempts, default: 0

      t.references :user
      t.references :deck

      t.timestamps(null: false)
    end
  end
end
