class Cocktail < ApplicationRecord
  mount_uploader :photo, PhotoUploader
  has_many :cocktail_tags, dependent: :destroy
  has_many :tags, through: :cocktail_tags
  has_many :doses, dependent: :destroy
  has_many :ingredients, through: :doses
  validates :name, presence: true, allow_blank: false, uniqueness: true
end
