class BoosController < ApplicationController
    skip_before_action :authorized, only: [:create]
    def create
        boo = Boo.new(boo_params)
        game= Game.find(boo_params[:game_id])
        game_user = GameUser.find_by(game_id: boo_params[:game_id], user_id: boo_params[:user_id])
       
        # byebug
        if boo.save
          if game_user.extra_bet > 0
            game.jackpot = game.jackpot + 0.05
            game.jackpot.round(2)
            game_user.extra_bet = game_user.extra_bet - 0.05
            game_user.total_bet = game_user.total_bet + 0.05
            game_user.extra_bet.round(2)
            game_user.total_bet.round(2)
            game_user.save
            game.save
          
            serialized_data = ActiveModelSerializers::Adapter::Json.new(
              BooSerializer.new(boo)
            ).serializable_hash
            BoosChannel.broadcast_to game, serialized_data
            head :ok
          end
        end
      end
      
      private
      
      def boo_params
        params.require(:boo).permit(:game_id, :horse_id, :user_id)
      end
end
