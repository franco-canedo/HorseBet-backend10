class GameUsersController < ApplicationController
    def join
        game_user = GameUser.create(game_user_params)

    end 

    private

    def game_user_params
        params.require(:game_user).permit(:user_id, :game_id)
    end 
end
