class AddLongitudeToPosts < ActiveRecord::Migration[5.1]
  def change
    add_column :posts, :longitude, :float
  end
end
