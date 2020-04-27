class GameUsersController < ApplicationController
    skip_before_action :authorized, only: [:join]
    def join
        game_user = GameUser.create(game_user_params)
        render json: game_user
    end 

    private

    def game_user_params
        params.require(:game_user).permit(:user_id, :game_id)
    end 
end
