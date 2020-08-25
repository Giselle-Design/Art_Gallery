class Like < ApplicationRecord
    belongs_to :user
    belongs_to :art


    validates(
        :art_id, 
        uniqueness: {
            scope: :user_id,
            message: "has already been liked"
        }
    )
end
