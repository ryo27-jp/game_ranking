class CreateGames < ActiveRecord::Migration[6.1]
  def change
    create_table :games do |t|
      t.string :title,              null: false
      t.string :description,        null: false
      t.string :release_date,       null: false
      t.string :production,         null: false

      t.timestamps
    end
  end
end
