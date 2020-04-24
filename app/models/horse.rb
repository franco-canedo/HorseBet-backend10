class Horse < ApplicationRecord
    has_one :game_horse
    has_one :game, through: :game_horse
    has_one :user_horse
    has_one :user, through: :user_horse
end
