class User < ApplicationRecord
    has_secure_password
    has_many :game_users
    has_many :games, through: :game_users
    has_many :user_horses
    has_many :horses, through: :user_horses
    has_many :game_winners

    validates :username, presence: true
    validates :username, uniqueness: true
    validates :password, presence: true, length: { minimum: 5 }
end
