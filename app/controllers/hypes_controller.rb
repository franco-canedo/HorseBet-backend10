class HypesController < ApplicationController
    skip_before_action :authorized, only: [:create]
    def create
        hype = Hype.new(hype_params)
        game= Game.find(hype_params[:game_id])
        # game_user = GameUser.find_by(game_id: hype_params[:game_id], user_id: hype_params[:user_id])
        game_user = GameUser.last
        if hype.save
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
                    HypeSerializer.new(hype)
                ).serializable_hash
                HypesChannel.broadcast_to game, serialized_data
                head :ok
            end
        end
      end
      
      private
      
      def hype_params
        params.require(:hype).permit(:game_id, :horse_id, :user_id)
      end
end
