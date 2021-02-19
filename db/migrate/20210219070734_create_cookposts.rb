class CreateCookposts < ActiveRecord::Migration[6.1]
  def change
    create_table :cookposts do |t|
      t.text :cooking_name
      t.text :ingredients
      t.text :cooking_recipe
      t.integer :user_id

      t.timestamps
    end
  end
end
