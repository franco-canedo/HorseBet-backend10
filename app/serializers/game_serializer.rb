class GameSerializer < ActiveModel::Serializer
  attributes :id, :jackpot, :minimum_bet, :winner
  has_many :boos
end
