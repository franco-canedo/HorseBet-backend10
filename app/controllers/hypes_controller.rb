class HypesController < ApplicationController
    skip_before_action :authorized, only: [:create]
    def create
        hype = Hype.new(hype_params)
        game= Game.find(hype_params[:game_id])
        if hype.save
          serialized_data = ActiveModelSerializers::Adapter::Json.new(
            HypeSerializer.new(hype)
          ).serializable_hash
          HypesChannel.broadcast_to game, serialized_data
          head :ok
        end
      end
      
      private
      
      def hype_params
        params.require(:hype).permit(:game_id, :horse_id)
      end
end
