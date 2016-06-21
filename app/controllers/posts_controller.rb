class PostsController < ApplicationController
#eos gsub syntax is to allow for multiline strings
   def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
  end


  def new
    @post = Post.new
  end

  def create
    @post = Post.new(
      title:  params[:post][:title],
      author: params[:post][:author],
      text:   params[:post][:text]
    )

    if @post.save
      redirect_to posts_path
    else
      render :new
    end
  end
end
