class DogsController<ApplicationController
  before_action :authenticate_user, only: [:new, :create, :destroy, :edit]

  def index
    @dogs = Dog.all
    if !params[:g].blank?
      puts "filtering by gender"
      @dogs = @dogs.where(:gender=> params[:g])
    end
    if !params[:n].blank?
      puts "filtering by gender"
      dog_name = params[:n].downcase
      @dogs = @dogs.where("LOWER (name) LIKE ?", "%#{dog_name}%")
    end
    if !params[:s].blank?
      dog_size = params[:s].downcase
      @dogs = @dogs.where("LOWER (size) LIKE ?", "%#{dog_size}%")
    end
    if !params[:p].blank?
      dog_personality = params[:p].downcase
      @dogs = @dogs.where("LOWER (personality) LIKE ?", "%#{dog_personality}%")
    end
    if !params[:y].blank?
      dog_play = params[:y].downcase
      @dogs = @dogs.where("LOWER (play) LIKE ?", "%#{dog_play}%")
    end
    if !params[:a].blank?
      dog_age = params[:a].downcase
      @dogs = @dogs.where("LOWER (age) LIKE ?", "%#{dog_age}%")
    end
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
