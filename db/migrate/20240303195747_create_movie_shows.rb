class CreateMovieShows < ActiveRecord::Migration[7.1]
  def change
    create_table :movie_shows do |t|
      t.string :title
      t.text :description
      t.datetime :release_date

      t.timestamps
    end
  end
end
