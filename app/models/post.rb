class Post < ActiveRecord::Base
  attr_accessible :content, :title, :public, :lang
  validates :title, :content, :lang, presence: true
  validates :lang, inclusion: %w(eng chn)
  default_scope order: 'posts.updated_at DESC'
  has_and_belongs_to_many :tags
end
