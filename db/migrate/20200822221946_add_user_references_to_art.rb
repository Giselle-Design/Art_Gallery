class AddUserReferencesToArt < ActiveRecord::Migration[6.0]
  def change
    add_reference :arts, :user, foreign_key: true
  end
end
