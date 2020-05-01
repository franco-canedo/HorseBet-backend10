class Api::V1::UsersController < ApplicationController
    skip_before_action :authorized, only: [:create, :index, :show, :deposit, :withdraw]

  def index
    users = User.all 
    render json: users.to_json(:include => [{:games => {:include => {:game_winners => {:include => :user}}}}])
  end 

  def show 
    user = User.find_by(id: params[:id])
    render json:  user.to_json(:include => [:games, {:game_winners => {:include => :game}}])
  end
 
  def profile
    render json: { user: UserSerializer.new(current_user) }, status: :accepted
  end
 
  def create
    @user = User.create(user_params)
    if @user.valid?
      @token = encode_token({ user_id: @user.id })
      render json: { user: UserSerializer.new(@user), jwt: @token }, status: :created
    else
      render json:  { error: @user.errors }, status: :not_acceptable
    end
  end

  def deposit
    user = User.find(params[:id])
    
    user.deposit += params[:amount]
    if user.save
      render json: user
    else 
      render json: { error: 'failed to deposit' }, status: :not_acceptable
    end
  end 

  def withdraw
    user = User.find(params[:id])
    user.deposit -= params[:amount]
    
    if user.save 
      render json: user
    else 
      render json: { error: 'failed to deposit' }, status: :not_acceptable
    end
  end 
 
  private
 
  def user_params
    params.require(:user).permit(:id, :username, :password, :amount)
  end
end
