class HorsesController < ApplicationController
    skip_before_action :authorized, only: [:create, :index, :show]

    def index 
        horse = Horse.all 
        render json: horse.to_json(:include => [:users, :game])
    end 
end
