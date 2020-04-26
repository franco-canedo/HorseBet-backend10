class Game < ApplicationRecord
    has_many :game_users
    has_many :users, through: :game_users
    has_many :game_horses
    has_many :horses, through: :game_horses
    has_many :game_winners
end
