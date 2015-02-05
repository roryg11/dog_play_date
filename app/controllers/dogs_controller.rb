class DogsController<ApplicationController
  before_action :authenticate_user, only: [:new, :create, :destroy, :edit]

  def index
    @dogs = Dog.all
  end
  def new
    @dog = Dog.new
  end

  def create
    @dog = current_user.dogs.new(dog_params)
    if @dog.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @dog = Dog.find(params[:id])
    render json: @dog
  end

  def edit
    @dog = Dog.find(params[:id])
  end

  def update
    @dog = Dog.find(params[:id])
    @dog.update(dog_params)
    if @dog.save
      redirect_to root_path
    else
      render :edit
      flash[:notice] = "Dog successfully updated"
    end
  end

  def destroy
    @dog = Dog.find(params[:id])
    @dog.destroy
    redirect_to root_path
    flash[:notice] = "Your Dog was removed from your profile"
  end
  private
  def dog_params
    params.require(:dog).permit(:name,
                                :breed,
                                :age,
                                :size,
                                :play,
                                :gender,
                                :personality,
                                :bio,
                                :user_id,
                                :image)
  end
end
