class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
  end

  def show
    @user = User.find(params[:id])
    if @user.save
      render json: @user
    else
      render json: @user.errors, status: :unprocessable_entity
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    if @user.save
      redirect_to user_path
    else
      render :edit
    end
  end


  private
  def user_params
    params.require(:user).permit(
    :name,
    :email,
    :password,
    :password_confirmation,
    :age,
    :zipcode,
    :gender,
    :bio,
    :avatar
    )
  end

end
