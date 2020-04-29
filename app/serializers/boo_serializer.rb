class BooSerializer < ActiveModel::Serializer
  attributes :id, :game_id, :horse_id, :user_id, :created_at
end
