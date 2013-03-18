class StaticPagesController < ApplicationController
  def about
  end

  def home
    if signed_in?
      @posts = Post.paginate(page: params[:page], per_page: 5)
    else
      @posts = Post.where(public: true).paginate(page: params[:page], per_page: 5)
    end
  end
end
