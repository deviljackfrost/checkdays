class CreatePostContents < ActiveRecord::Migration[6.1]
  def change
    create_table :post_contents do |t|
      t.string :title
      t.string :caption
      t.integer :user_id
      t.string :content
      t.string :image
      t.timestamps
    end
  end
end
