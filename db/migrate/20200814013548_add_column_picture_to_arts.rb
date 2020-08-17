class AddColumnPictureToArts < ActiveRecord::Migration[6.0]
  def change
    add_column(:arts, :picture, :binary)
  end
end
