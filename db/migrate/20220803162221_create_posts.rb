class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      t.string :title
      t.string :category
      t.string :image_url
      t.string :content
      t.string :author
      t.float :rating

      
      t.timestamps
    end
  end
end
