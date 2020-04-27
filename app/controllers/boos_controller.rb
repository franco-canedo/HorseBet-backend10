class BoosController < ApplicationController
    skip_before_action :authorized, only: [:create]
    def create
        boo = Boo.new(boo_params)
        game= Game.find(boo_params[:game_id])
        if boo.save
          serialized_data = ActiveModelSerializers::Adapter::Json.new(
            BooSerializer.new(boo)
          ).serializable_hash
          BoosChannel.broadcast_to game, serialized_data
          head :ok
        end
      end
      
      private
      
      def boo_params
        params.require(:boo).permit(:game_id, :horse_id)
      end
end
