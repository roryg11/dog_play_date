class FiltersController < ApplicationController
  before_action :set_filter, only: [:show, :edit, :update, :destroy]
  before_action :set_type
  before_action do
    @user = current_user
  end

  def index
    @filters = Filter.where(type: type)
  end

  def new
    @filter = Filter.new(type: type)
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

  def set_type
    @type = type
  end

  def type
    Filter.types.include?(params[:type]) ? params[:type] : "Filter"
  end

  # def type_class
  #   type.constantize
  # end

  def set_filter
    @filter = type_class.find(params[:id])
  end

  def filter_params
    params.require(type.underscore.to_sym).permit(:type, :content)
  end

end
