class GamesController < ApplicationController
    skip_before_action :authorized, only: [:create, :index, :show]

    def index
        games = Game.all 
        render json: games.to_json(:include => [:users, :horses, {:game_winners => {:include => :user}}])
    end 

    def show 
        game = Game.find(params[:id])
        render json: game
    end 
end
