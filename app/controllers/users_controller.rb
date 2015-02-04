class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
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
