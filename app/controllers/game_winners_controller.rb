class GameWinnersController < ApplicationController
    skip_before_action :authorized, only: [:winner]
    def show 
        win = GameWinner.find(params[:id])
        render json: win.to_json(:include => [:user, :game])
    end 

    def winner 
        check = GameWinner.find_by(game_id: game_winner_params[:game_id])
        if !check
            game_winner = GameWinner.new(game_winner_params)
            game = Game.find_by(id: game_winner_params[:game_id])
            user_horse = UserHorse.find_by(horse_id: game_winner_params[:horse_id])
            game_winner.user_id = user_horse.user_id
            user = User.find_by(id: user_horse.user_id)

            user2 = User.find_by(username: "Dane")
            game_user = GameUser.find_by(user_id: user2.id)
            user2.deposit -= game_user.total_bet
            user2.save
            # byebug
            if game_winner.save
                game.winner = user.username
                game.save
                user.deposit += game.jackpot
                user.winnings += game.jackpot
                user.number_wins += 1
                user.save
                # byebug
                serialized_data = ActiveModelSerializers::Adapter::Json.new(
                GameWinnerSerializer.new(game_winner)
                ).serializable_hash
                GameWinnersChannel.broadcast_to game, serialized_data
                head :ok
            end 
        end         
    end 

    private

    def game_winner_params
        params.require(:game_winner).permit(:user_id, :game_id, :moneyWon, :horse_id)
    end 
end
