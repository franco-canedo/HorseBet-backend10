class GamesController < ApplicationController
    skip_before_action :authorized, only: [:create, :index, :show]

    def index
        games = Game.all 
        render json: games.to_json(:include => [:users, :horses])
    end 

    def show 
        game = Game.find(params[:id])
        render json: game
    end 
end
