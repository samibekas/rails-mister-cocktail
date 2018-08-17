class CocktailTag < ApplicationRecord
  belongs_to :cocktail
  belongs_to :tag
end
