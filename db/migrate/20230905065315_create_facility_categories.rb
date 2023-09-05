class CreateFacilityCategories < ActiveRecord::Migration[7.0]
  def change
    create_table :facility_categories do |t|
      t.string :category_name, null: false
      t.timestamps
    end
  end
end
