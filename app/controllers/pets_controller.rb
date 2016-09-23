class PetsController < ApplicationController

  before_action :authenticate_user!
  helper_method :sort_column, :sort_direction

  def index
    # @pets = Pet.search(params[:search])
    if @category = PetCategory.search(params[:search]).first
      @pets = Pet.where(pet_category_id: @category.id).order(sort_column + " " + sort_direction).paginate(:per_page => 10, :page => params[:page])
    else
      @pets = Pet.order(sort_column + " " + sort_direction).paginate(:per_page => 10, :page => params[:page])
    end
    # @pets = Pet.order(sort_column + " " + sort_direction)
  end

  def show
    @pet = Pet.find(params[:id])
  end

  def edit
    @pet = Pet.find(params[:id])
  end

  def new
    @pet = Pet.new
    @categories = PetCategory.all
    @types = Type.all
  end

  def create
    @categories = PetCategory.all
    @pet = current_user.pets.new(pet_params)
    if @pet.save
      flash[:notice] = "Pet saved successfully"
      render :new
    else
      flash[:alert] = "Pet failed to save"
      render :new
    end
  end

  def update
    @pet = Pet.find(params[:id])
    if @pet.update(pet_params)
      flash[:notice] = "Pet updated"
      redirect_to pet_path(@pet)
    else
      flash[:alert] = "Pet update failed"
      redirect_to pet_path(@pet)
    end
  end

  def destroy
    @pet = Pet.find(params[:id])
    if @pet.delete
      flash[:notice] = "Pet deleted"
      redirect_to pets_path
    else
      flash[:alert] = "Pet failed to delete"
    end
  end
  private

  def sort_column
    Pet.column_names.include?(params[:sort]) ? params[:sort] : "time_consumed"
  end

  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
  end

  def pet_params
    params.require(:pet).permit(:pet_category_id, :name, :species, :age, :about, )
  end
end
