class CreateStoryReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :story_reviews do |t|
      t.integer :story_id
      t.integer :review_id

      t.timestamps
    end
  end
end
