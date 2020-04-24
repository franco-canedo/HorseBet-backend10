class GameHorse < ApplicationRecord 
    belongs_to :game
    belongs_to :horse 
end
