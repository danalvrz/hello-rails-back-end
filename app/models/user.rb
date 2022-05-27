class User < ApplicationRecord
    has_secure_password
    has_many :favorites, dependent: :destroy

    validates :username, uniqueness: true
    validates :username, presence: true
end
