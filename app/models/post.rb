class Post < ActiveRecord::Base
  attr_accessible :content, :title, :public, :lang, :tags_attributes, :tag_list
  validates :title, :content, :lang, presence: true
  validates :lang, inclusion: %w(eng chn)
  default_scope order: 'posts.updated_at DESC'
  has_and_belongs_to_many :tags
  accepts_nested_attributes_for :tags

  def self.tagged_with(name)
    Tag.find_by_name!(name).posts
  end

  def self.tag_counts
    Tag.select("tags.*, count(tags.tag_id) as count")
  end

  def tag_list
    tags.map(&:name).join(", ")
  end

  def tag_list=(names)
    self.tags = names.split(",").map do |n|
      Tag.where(name: n.strip).first_or_create!
    end
  end
end
