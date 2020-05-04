class GameUsersController < ApplicationController
    skip_before_action :authorized, only: [:join]
    def join
        game_user = GameUser.new(game_user_params)
        game = Game.find_by(id: game_user_params[:game_id])
        game.jackpot += game_user_params[:total_bet]
        game.save
        # byebug
        if game_user.save
            serialized_data = ActiveModelSerializers::Adapter::Json.new(
              GameUserSerializer.new(game_user)
            ).serializable_hash
            ActionCable.server.broadcast 'game_users_channel', serialized_data
            head :ok
        end 
        
        # game = Game.find_by(id: params[:game_id])
        
        # if game.users >= 2
        #     game_user.bettable = true
        #     game.bettable = true
        #     game.save
        #     game_user.save
        #     serialized_data = ActiveModelSerializers::Adapter::Json.new(
        #     GameUserSerializer.new(game_user)
        #   ).serializable_hash
        #   GameUsersChannel.broadcast_to game, serialized_data
        #   head :ok
        # elsif 
        #     serialized_data = ActiveModelSerializers::Adapter::Json.new(
        #     GameUserSerializer.new(game_user)
        #   ).serializable_hash
        #   GameUsersChannel.broadcast_to game, serialized_data
        #   head :ok
        # end 
        
    end 

    private

    def game_user_params
        params.require(:game_user).permit(:user_id, :game_id, :total_bet, :extra_bet)
    end 
end
