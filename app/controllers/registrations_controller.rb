class RegistrationsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      flash[:notice] = "You're Signed Ip!"
      redirect_to new_dog_path
    else
      render :new
      flash[:alert] = "Your registration could not be completed"
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
