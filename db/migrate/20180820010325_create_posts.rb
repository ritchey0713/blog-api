class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.string :title
      t.string :caption
      t.string :img_url
      t.integer :likes
      t.timestamps
    end
  end
end
