class UserHorsesController < ApplicationController
    skip_before_action :authorized, only: [:create]

    def create 
        user_horse = UserHorse.create(user_horse_params)
        game = Game.find_by(id: params[:game_id])
        game.bets_placed = game.bets_placed + 1
        game.save
        if game.bets_placed === game.users.length
            game.active = true
            # byebug
            game.save
        end 
        render json: user_horse
    end 

    private

    def user_horse_params
        params.require(:user_horse).permit(:user_id, :horse_id, :game_id)
    end
end
