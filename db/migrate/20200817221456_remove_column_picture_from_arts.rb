class RemoveColumnPictureFromArts < ActiveRecord::Migration[6.0]
  def change
    remove_column(:arts, :picture, :binary)
  end
end
