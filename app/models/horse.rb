class Horse < ApplicationRecord
    has_one :game_horse
    has_one :game, through: :game_horse
    has_many :user_horses
    has_many :users, through: :user_horses
end
