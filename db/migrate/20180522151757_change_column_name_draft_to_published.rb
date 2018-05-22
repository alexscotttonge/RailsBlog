class ChangeColumnNameDraftToPublished < ActiveRecord::Migration[5.2]
  def change
    rename_column :posts, :draft, :published 
  end
end
