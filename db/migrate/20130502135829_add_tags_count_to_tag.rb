class AddTagsCountToTag < ActiveRecord::Migration
  def change
    add_column :tags, :tags_count, :integer, default: 0
  end
end
