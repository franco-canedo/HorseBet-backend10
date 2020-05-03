class GamesController < ApplicationController
    skip_before_action :authorized, only: [:create, :index, :show, :active, :joinable]

    def index
        games = Game.all 
        render json: games.to_json(:include => [:users, :horses, {:game_winners => {:include => :user}}])
    end 

    def show 
        game = Game.find(params[:id])
        render json: game.to_json(:include => [:users, :game_users, {:horses => {:include => :users}}, {:game_winners => {:include => :user}}])
    end 

    def create 
        game = Game.new(game_params)
        
        if game.save
            h1 = Horse.create(name: 'Alfie', speed: 10)
            GameHorse.create(game_id: game.id, horse_id: h1.id)
            h2 = Horse.create(name: 'Seabiscuit', speed: 10)
            GameHorse.create(game_id: game.id, horse_id: h2.id)
            h3 = Horse.create(name: 'Flash', speed: 10)
            GameHorse.create(game_id: game.id, horse_id: h3.id)
            h4 = Horse.create(name: 'Lucky', speed: 10)
            GameHorse.create(game_id: game.id, horse_id: h4.id)
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
