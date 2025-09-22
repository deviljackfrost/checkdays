class AddPostCommentIdToImages < ActiveRecord::Migration[6.1]
  def change
    add_column :images, :post_comment_id, :interger
  end
end
