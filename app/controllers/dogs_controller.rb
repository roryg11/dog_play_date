class DogsController<ApplicationController
  before_action :authenticate_user, only: [:new, :create, :destroy, :edit]

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

  private
  def dog_params
    params.require(:dog).permit(:name, :breed, :age, :size, :play, :gender, :personality, :bio, :user_id)
  end
end
