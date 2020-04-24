class UserHorse < ApplicationRecord
    belongs_to :user 
    belongs_to :horse 
end
