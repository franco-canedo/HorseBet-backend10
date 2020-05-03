class GameWinnerSerializer < ActiveModel::Serializer
  attributes :id, :user_id, :game_id, :moneyWon, :horse_id
end
