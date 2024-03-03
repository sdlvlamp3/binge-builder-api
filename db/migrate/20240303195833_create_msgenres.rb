class CreateMsgenres < ActiveRecord::Migration[7.1]
  def change
    create_table :msgenres do |t|
      t.references :movie_show, null: false, foreign_key: true
      t.references :genre, null: false, foreign_key: true

      t.timestamps
    end
  end
end
