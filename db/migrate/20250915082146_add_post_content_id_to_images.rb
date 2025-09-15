class AddPostContentIdToImages < ActiveRecord::Migration[6.1]
  def change
    add_column :images, :post_content_id, :string
  end
end
