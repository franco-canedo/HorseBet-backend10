class GameUserSerializer < ActiveModel::Serializer
  attributes :id, :game_id, :user_id, :total_bet, :extra_bet
end
