class CreateReviews < ActiveRecord::Migration
  def change
    create_table(:reviews) do |t|
      t.belongs_to :user,   :null => false
      t.belongs_to :sauce,  :null => false
      t.integer :rating,    :null => false, :default => 0

      t.timestamps
    end

    rename_table :flavors_sauces, :flavors_reviews
    rename_column :flavors_reviews, :sauce_id, :review_id
  end
end
