class ArtCollectionSerializer < ActiveModel::Serializer
  attributes(
    :id,
    :title,
    :description,
    :created_at,
    :updated_at
  )

  belongs_to :user, key: :painter

  class UserSerializer < ActiveModel::Serializer
    attributes(
    :first_name,
    :last_name,
    :email,
    :created_at,
    :updated_at
  )
  end
end
