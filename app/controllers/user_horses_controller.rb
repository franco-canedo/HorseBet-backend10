class UserHorsesController < ApplicationController
    skip_before_action :authorized, only: [:create]

    def create 
        user_horse = UserHorse.create(user_horse_params)
        game = Game.find_by(id: params[:game_id])
        game.bets_placed = game.bets_placed + 1
        game.save
        #byebug

        # if user_horse.save
        #     if game.bets_placed === game.users.length 
        #         game.active = true
        #         game.joinable = false
        #         user_horse.active = true
        #         user_horse.save

        #         game.save
        #             serialized_data = ActiveModelSerializers::Adapter::Json.new(
        #             UserHorseSerializer.new(user_horse)
        #         ).serializable_hash
        #         UserHorsesChannel.broadcast_to game, serialized_data
        #         head :ok
        #     end 
        # end 
        
        if game.bets_placed === game.users.length 
            game.active = true
            game.joinable = false
            user_horse.active = true
            user_horse.save
            # byebug
            game.save
            serialized_data = ActiveModelSerializers::Adapter::Json.new(
            UserHorseSerializer.new(user_horse)
          ).serializable_hash
          UserHorsesChannel.broadcast_to game, serialized_data
          head :ok
        elsif user_horse.save
            serialized_data = ActiveModelSerializers::Adapter::Json.new(
            UserHorseSerializer.new(user_horse)
          ).serializable_hash
          UserHorsesChannel.broadcast_to game, serialized_data
          head :ok
        #   byebug
        end 
       
    end 

    private

    def user_horse_params
        params.require(:user_horse).permit(:user_id, :horse_id, :game_id)
    end
end
