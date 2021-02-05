class AddBodyToReview < ActiveRecord::Migration[6.1]
  def change
    add_column :reviews, :body, :string, null: false
  end
end
