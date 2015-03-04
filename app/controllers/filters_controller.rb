class FiltersController < ApplicationController
  before_action do
    @user = current_user
  end

  def index
    @filters = @user.filters.all
  end

  def new
    @filter = @user.filters.new
  end

  def create
    @filter = @user.filters.create(filter_params)
    if @filter.save
      redirect_to user_filters_path(@user)
    else
      render :new
    end
  end

  def update
  end

  def destroy
  end

  def show
  end

  private
  def filter_params
    params.require(:filter).permit(:age, :gender, :size, :personality, :play, :blocked_user_id)
  end

end
