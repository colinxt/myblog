class Post < ActiveRecord::Base
  attr_accessible :content, :title, :public
  validates :title, :content, presence: true
  default_scope order: 'posts.created_at DESC'
end
