class CreateGuesses < ActiveRecord::Migration
  def change
    create_table :guesses do |t|
      # t.boolean :first_try, default: false # true???
      t.boolean :correct, default: false

      t.references :round
      t.references :card

      t.timestamps(null: false)
    end
  end
end
