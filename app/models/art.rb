class Art < ApplicationRecord
  
  has_one_attached :image
  has_many(:comments, dependent: :destroy)
  belongs_to :user

  has_many(:likes,  dependent: :destroy) 
  has_many :likers, through: :likes, source: :user

end
