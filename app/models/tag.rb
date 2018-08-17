class Tag < ApplicationRecord
  has_many :cocktail_tags, dependent: :destroy
end
