class BlogsController < ApplicationController
  before_action :set_blog, only: [:show, :edit, :update, :destroy]
  before_action :check_admin, except: :index

  def index
    @blogs = Blog.all
  end

  def show
  end

  def new
    @blog = Blog.new
  end

  def edit
  end

  def create
    @blog = Blog.new(blog_params)

      if @blog.save
        redirect_to @blog, notice: 'Блог был успешно добавлен.'
      else
        render :new
      end
  end

  def update
      if @blog.update(blog_params)
        redirect_to @blog, notice: 'Блог был успешно обновлен.'
      else
        render :edit
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
      params.require(:blog).permit(:title, :author, :link, :rss_link)
    end
end