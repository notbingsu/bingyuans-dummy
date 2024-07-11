class CreateGames < ActiveRecord::Migration[7.1]
  def change
    create_table :games do |t|
      t.boolean :in_game
      t.string :occupation
      t.text :log

      t.timestamps
    end
  end
end
