class WelcomeController < ApplicationController
    def index
        render json: {error: "hello master!"}
    end 
end
