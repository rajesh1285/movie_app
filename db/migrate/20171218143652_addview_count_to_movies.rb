class AddviewCountToMovies < ActiveRecord::Migration[5.1]
  def change
  	add_column :movies ,:count, :integer
  end
end
