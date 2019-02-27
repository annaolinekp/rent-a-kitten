class AddPhotoToKittens < ActiveRecord::Migration[5.2]
  def change
    add_column :kittens, :photo, :string
  end
end
