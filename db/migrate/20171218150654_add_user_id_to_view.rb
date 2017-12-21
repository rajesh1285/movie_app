class AddUserIdToView < ActiveRecord::Migration[5.1]
  def change
  	add_reference :views,:movie
  end
end
