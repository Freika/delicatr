class BlogsController < ApplicationController
  before_action :set_blog, only: [:show, :edit, :update, :destroy]
  before_action :check_admin, except: [:index, :show, :new, :create]

  def index
    @blogs = Blog.all
  end

  def show
    @blog = Blog.find(params[:id])
    @posts = @blog.posts.paginate(page: params[:page], per_page: 10)
  end

  def new
    @blog = Blog.new
  end

  def edit
  end

   def create
    @post = Blog.new(blog_params)

    respond_to do |format|
      if @blog.save
        format.html { redirect_to @blog, notice: 'Блог опубликован.' }
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @blog.update(blog_params)
        format.html { redirect_to @blog, notice: 'Блог обновлен.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @blog.destroy
    redirect_to blogs_url, notice: 'Блог был успешно удален.'
  end

private

  def set_blog
    @blog = Blog.find(params[:id])
  end

  def blog_params
    params.require(:blog).permit(:title, :author, :link, :feed_url, :approved)
  end
end
