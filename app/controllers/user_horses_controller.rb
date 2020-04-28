class UserHorsesController < ApplicationController
    skip_before_action :authorized, only: [:create]

    def create 
        user_horse = UserHorse.create(user_horse_params)
        render json: user_horse
    end 

    private

    def user_horse_params
        params.require(:user_horse).permit(:user_id, :horse_id)
    end
end
