class ArtSerializer < ActiveModel::Serializer
  # You decide how to display your data (which colunm) in json.
  attributes(
    :id,
    :title,
    :description,
    :created_at,
    :updated_at,
    :like_count
  )
# to include associated models, use the same method for
#creating associations also you can re-name the association with a key.
  belongs_to :user, key: :painter
  has_many :comments


  class CommentSerializer < ActiveModel::Serializer
    attributes(
    :id,
    :body,
    :created_at,
    :updated_at
  )
  end

  def like_count
    object.likes.count
  end


end
