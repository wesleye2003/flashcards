class CreateGuesses < ActiveRecord::Migration
  def change
    create_table :guesses do |t|
      t.boolean :first_try, default: false
      t.boolean :correct, default: false

      t.timestamps(null: false)
    end
  end
end
