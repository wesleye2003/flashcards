class CreateGuesses < ActiveRecord::Migration
  def change
    create_table :guesses do |t|
      t.integer :card_id
      t.integer :round_id
      t.string  :response
      t.boolean :correct

      t.timestamps null: false
    end
  end
end
