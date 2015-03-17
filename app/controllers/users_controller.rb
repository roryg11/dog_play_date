class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
  end

  def show
    @user = User.find(params[:id])
    @filters=@user.filters.all

    @dogs = Dog.all
    @filters.each do |filter|
      @dogs = filter.filter(@dogs)
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    if @user.save
      redirect_to user_path
      flash[:notice] = "Your information was successfully updated."
    else
      render :edit
      flash[:alert] = "Your information could not be saved."
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
