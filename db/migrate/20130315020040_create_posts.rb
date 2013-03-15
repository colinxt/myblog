class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title
      t.string :content
      t.boolean :public

      t.timestamps
    end
    add_index :posts, [:created_at]
  end
end
