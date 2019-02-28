class AddCoordinatesToKittens < ActiveRecord::Migration[5.2]
  def change
    add_column :kittens, :latitude, :float
    add_column :kittens, :longitude, :float
  end
end
