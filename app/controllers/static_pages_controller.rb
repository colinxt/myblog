class StaticPagesController < ApplicationController
  def about
  end

  def home
    @posts = Post.all
  end
end
