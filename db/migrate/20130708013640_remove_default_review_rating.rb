class RemoveDefaultReviewRating < ActiveRecord::Migration
  def up
    change_column :reviews, :rating, :integer, default: nil
  end

  def down
    change_column :reviews, :rating, :integer, default: 0
  end
end
