class WelcomeController < ApplicationController
    def index
        render json: {error: "hello"}
    end 
end
