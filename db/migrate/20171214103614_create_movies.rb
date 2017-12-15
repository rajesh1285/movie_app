class CreateMovies < ActiveRecord::Migration[5.1]
  def change
    create_table :movies do |t|
      t.string :title
      t.string :genr
      t.integer :rating
      t.text :plot
      t.text :cast

      t.timestamps
    end
  end
end
