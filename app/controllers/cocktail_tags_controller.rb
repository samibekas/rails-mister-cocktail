class CocktailTagsController < ApplicationController
  def new
    @cocktail = Cocktail.find(params[:cocktail_id])
    @cocktail_tag = CocktailTag.new
  end

  def create
    @tags = Tag.where(id: params[:cocktail_tag][:tag])
    @cocktail = Cocktail.find(params[:cocktail_id])
    @tags.each do |tag|
      CocktailTag.create(cocktail: @cocktail, tag: tag)
    end
    if @tags.empty?
      render :new
    else
      redirect_to cocktail_path(@cocktail)
    end
  end

  private

  def cocktail_tag_params
    params.require(:cocktail_tag).permit(:tag_id)
  end
end
