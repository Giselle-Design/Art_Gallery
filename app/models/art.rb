class Art < ApplicationRecord
  
  has_one_attached :image
  has_many(:comments, dependent: :destroy)
  belongs_to :user

  has_many(:likes,  dependent: :destroy) 
  has_many :likers, through: :likes, source: :user

  def self.all_with_comment_counts
    self.left_outer_joins(:comments)
        .select("arts.*", "COUNT(comments.*) AS comments_count")
        .group("arts.id")
      # https://edgeguides.rubyonrails.org/active_record_querying.html#left-outer-joins
end

end
