class AddbuttonTomovies < ActiveRecord::Migration[5.1]
  def change
  	add_column :movies, :website, :string
  	  end
end
