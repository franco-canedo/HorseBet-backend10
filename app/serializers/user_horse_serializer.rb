class UserHorseSerializer < ActiveModel::Serializer
  attributes :id, :user_id, :horse_id, :game_id, :active
end
