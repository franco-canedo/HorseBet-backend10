class UserSerializer < ActiveModel::Serializer
  attributes :id, :username, :games, :game_winners, :deposit, :winnings, :number_wins
end
