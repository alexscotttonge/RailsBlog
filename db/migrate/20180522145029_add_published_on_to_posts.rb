class AddPublishedOnToPosts < ActiveRecord::Migration[5.2]
  def change
    add_column :posts, :published_on, :datetime
    add_index :posts, :published_on
  end
end
