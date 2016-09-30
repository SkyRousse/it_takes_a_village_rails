class PetsController < ApplicationController

  before_action :authenticate_user!
  helper_method :sort_column, :sort_direction

  def index
    # if @category = PetCategory.search(params[:search]).first
    #   @pets = Pet.where(pet_category_id: @category.id).order(sort_column + " " + sort_direction).paginate(:per_page => 50, :page => params[:page])
    # else
      @pets = Pet.order(sort_column + " " + sort_direction).paginate(:per_page => 50, :page => params[:page])
    # end
  end

  def show
    @pet = Pet.find(params[:id])
  end

  def edit
    @categories = PetCategory.all
    @pet = Pet.find(params[:id])
    if is_owner === false
      flash[:alert] = "Only pet owners can update pet info"
      redirect_to pets_path
    end
  end

  def new
    @pet = Pet.new
    @categories = PetCategory.all
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
    @categories = PetCategory.all
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
    if is_owner
      @pet.delete
      flash[:notice] = "Pet deleted"
      redirect_to pets_path
    else
      flash[:alert] = "Pet not deleted only pet owners can remove pets"
      redirect_to pets_path
    end
  end
  private

  def sort_column
    Pet.column_names.include?(params[:sort]) ? params[:sort] : "species"
  end

  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
  end

  def is_owner
    current_user === @pet.user
  end

  def pet_params
    params.require(:pet).permit(:pet_category_id, :name, :species, :age, :about, )
  end
end
