class CocktailsController < ApplicationController
  def index
    @cocktails = Cocktail.all
  end

  def show
    @cocktail = Cocktail.find(params[:id])
    @doses = Dose.where(cocktail_id: @cocktail)
  end

  def new
    @cocktail = Cocktail.new
  end

  def create
    @cocktail = Cocktail.new(cocktail_params)
    @tags = Tag.all
    @tags.each do |tag|
      CocktailTag.create(cocktail: @cocktail, tag: tag)
    end
    # @tag_names = params[:cocktail][:tags]
    # raise
    # @tag_names.each do |tag_name|
    #   tag = Tag.find_by(name: tag_name)
    #   # tag = Tag.create(name: tag_name) unless tag
    #   CocktailTag.create(cocktail: @cocktail, tag: tag_name)
    # end
    if @cocktail.save
      redirect_to cocktail_path(@cocktail)
    else
      render :new
    end
  end

  def destroy
    @cocktail = Cocktail.find(params[:id])
    @cocktail.destroy
    redirect_to cocktails_path
  end

  private

  def cocktail_params
    params.require(:cocktail).permit(:name, :ingredients, :doses, :photo, :tags)
  end
end
