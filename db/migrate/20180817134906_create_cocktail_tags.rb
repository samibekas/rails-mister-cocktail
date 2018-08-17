class CreateCocktailTags < ActiveRecord::Migration[5.2]
  def change
    create_table :cocktail_tags do |t|
      t.references :cocktail, foreign_key: true
      t.references :tag, foreign_key: true

      t.timestamps
    end
  end
end
