class CreateDecks < ActiveRecord::Migration
  def change
    add_table :decks do |t|
      t.string :name

      t.timestamps, null: false
    end
  end
end
