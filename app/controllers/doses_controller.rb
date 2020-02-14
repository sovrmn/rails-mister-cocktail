class DosesController < ApplicationController
  def new
    @dose = Dose.new
  end

  def create
    @cocktail = Cocktail.find(params[:cocktail_id]) #on récupère l'id du cocktail
    @dose = Dose.new(dose_params)
    @dose.cocktail = @cocktail #on retrouve le cocktail correspondant à la dose grace à l'ID
    @dose.save
    redirect_to cocktail_path(@cocktail)
  end

  def destroy
    @dose = Dose.find(params[:id])
    @dose.destroy
    redirect_to dose_path
  end

  private

  def dose_params
    params.require(:dose).permit(:description, :ingredient_id)
  end

end

