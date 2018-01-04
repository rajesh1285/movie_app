class AddColumnToReviews < ActiveRecord::Migration[5.1]
  def change
    add_column :reviews, :like, :integer
    add_column :reviews, :dislike, :integer
  end
end
