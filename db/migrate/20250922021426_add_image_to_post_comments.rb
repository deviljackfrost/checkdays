class AddImageToPostComments < ActiveRecord::Migration[6.1]
  def change
    add_column :post_comments, :image, :string
  end
end
