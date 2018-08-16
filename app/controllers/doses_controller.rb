class DosesController < ApplicationController
  # def index
  #   @cocktail = Cocktail.find(params[:cocktail_id])
  #   @doses = Dose.where(cocktail_id: @cocktail)
  # end

  # def show
  #   @dose = Dose.find(params[:id])
  # end

  def new
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose = Dose.new
  end

  def create
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose = Dose.new(doses_params)
    @dose.cocktail = @cocktail
    if @dose.save
      redirect_to cocktail_path(@cocktail)
    else
      render "/doses/new"
    end
  end

  def destroy
    @dose = Dose.find(params[:id])
    @cocktail = @dose.cocktail
    @dose.delete
    redirect_to cocktail_path(@cocktail)
  end

  private

  def doses_params
    params.require(:dose).permit(:description, :ingredient_id, :cocktail_id)
  end
end
