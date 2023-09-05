class CreateReviewFacilityCategories < ActiveRecord::Migration[7.0]
  def change
    create_table :review_facility_categories do |t|
      t.integer :review_id, null: false
      t.integer :facility_category_id, null: false
      t.timestamps
    end
  end
end
