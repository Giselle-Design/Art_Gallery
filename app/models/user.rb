class User < ApplicationRecord
  has_many :arts, dependent: :nullify
  has_many :comments, dependent: :nullify
  has_secure_password

  has_many :likes
  has_many :liked_arts, through: :likes, source: :art


    VALID_EMAIL_REGEX = /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
    validates :email, presence: true, uniqueness: true, format: VALID_EMAIL_REGEX

    def full_name
        "#{first_name} #{last_name}".strip
    end
end
