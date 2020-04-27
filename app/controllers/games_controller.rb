class GamesController < ApplicationController
    skip_before_action :authorized, only: [:create, :index, :show, :active, :joinable]

    def index
        games = Game.all 
        render json: games.to_json(:include => [:users, :horses, {:game_winners => {:include => :user}}])
    end 

    def show 
        game = Game.find(params[:id])
        render json: game
    end 

    def create 
        game = Game.new(game_params)

        if game.save
            serialized_data = ActiveModelSerializers::Adapter::Json.new(
              GameSerializer.new(game)
            ).serializable_hash
            ActionCable.server.broadcast 'games_channel', serialized_data
            head :ok
        end
    end 

    def active 
        games = Game.where(active: true)
        render json: games.to_json(:include => [:users, :horses, {:game_winners => {:include => :user}}])
    end 

    def joinable
        games = Game.where(joinable: true)
        render json: games.to_json(:include => [:users, :horses, {:game_winners => {:include => :user}}])
    end 



    private
  
    def game_params
        params.require(:game).permit(:minimum_bet, :jackpot)
    end
end
