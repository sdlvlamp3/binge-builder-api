class RenameMsgenresToMovieShowGenres < ActiveRecord::Migration[7.1]
  def change
    rename_table :msgenres, :MovieShow_Genres
  end
end
