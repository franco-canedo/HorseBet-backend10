class BoosController < ApplicationController
    def create
        boo = Message.new(boo_params)
        game= Game.find(boo_params[:game_id])
        if boo.save
          serialized_data = ActiveModelSerializers::Adapter::Json.new(
            MessageSerializer.new(boo)
          ).serializable_hash
          MessagesChannel.broadcast_to game, serialized_data
          head :ok
        end
      end
      
      private
      
      def boo_params
        params.require(:boo).permit(:text, :game_id, :horse_id)
      end
end
