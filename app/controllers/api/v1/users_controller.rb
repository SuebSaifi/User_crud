class Api::V1::UsersController < ApplicationController
  skip_before_action :verify_authenticity_token
  def index
    @users = User.all
    render json: @users
  end

  def show
  @user = User.find(params[:id])
  render json: @user
  end

  def create
  @user = User.new(user_params)
  if @user.save
    render json:{message:"User has been created" }
  else
    render json:{message: "no content"}
  end
  end
  def update
  @user=User.find(params[:id])
  if  @user
    @user.update(user_params)
    render json:{ message:"User has been updated"}
  end

  end

  def destroy
  @user = User.find(params[:id])
  if @user.destroy
    render json: {message: "user has been deleted  successfully"}
  end
  end
  
  private

  def user_params
    params.require(:user).permit(:username,:password)  
  end
  
end
