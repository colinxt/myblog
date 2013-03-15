class Post < ActiveRecord::Base
  attr_accessible :content, :title, :public
  validates :title, :content, :public, presence: true
  default_scope order: 'posts.created_at DESC'
end
