class GameWinnersController < ApplicationController
    def show 
        win = GameWinner.find(params[:id])
        render json: win
    end 
end
