class SavedPetsController < ApplicationController
  before_action :set_saved_pet, only: [:show, :edit, :update, :destroy]

  # GET /saved_pets
  # GET /saved_pets.json
  def index
    @saved_pets = SavedPet.all
  end

  # GET /saved_pets/1
  # GET /saved_pets/1.json
  def show
  end
  
  def userIndex

    @saved_pet = SavedPet.where(:user => current_user.id).all
  end

  # GET /saved_pets/new
  def new
    @saved_pet = SavedPet.new
  end

  # GET /saved_pets/1/edit
  def edit
  end

  # POST /saved_pets
  # POST /saved_pets.json
  def create
    @saved_pet = SavedPet.new(saved_pet_params)

    respond_to do |format|
      if @saved_pet.save
        format.html { redirect_to @saved_pet, notice: 'Saved pet was successfully created.' }
        format.json { render :show, status: :created, location: @saved_pet }
      else
        format.html { render :new }
        format.json { render json: @saved_pet.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /saved_pets/1
  # PATCH/PUT /saved_pets/1.json
  def update
    respond_to do |format|
      if @saved_pet.update(saved_pet_params)
        format.html { redirect_to @saved_pet, notice: 'Saved pet was successfully updated.' }
        format.json { render :show, status: :ok, location: @saved_pet }
      else
        format.html { render :edit }
        format.json { render json: @saved_pet.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /saved_pets/1
  # DELETE /saved_pets/1.json
  def destroy
    @saved_pet.destroy
    respond_to do |format|
      format.html { redirect_to saved_pets_url, notice: 'Saved pet was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_saved_pet
      @saved_pet = SavedPet.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def saved_pet_params
      params.require(:saved_pet).permit(:user, :pet_id)
    end
end
