class CreateTracks < ActiveRecord::Migration
  def change
    create_table :tracks do |t|
      t.string :name, null: false
      t.boolean :bonus, default: false
      t.text :lyrics
      t.references :album, index: true, foreign_key: true, null: false

      t.timestamps null: false
    end
  end
end
