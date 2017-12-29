class AddviewCountToMovies < ActiveRecord::Migration[5.1]
  def change
  	add_column :views ,:views_count, :integer
  end
end
