class RegistrationsController < ApplicationController
  # def new
  #   @user = User.new
  # end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] =@user.id
      render json: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  private
  def user_params
    params.require(:user).permit(:name,
                                :email,
                                :password,
                                :password_confirmation,
                                :age,
                                :zipcode,
                                :gender,
                                :bio,
                                :avatar)
  end
end
