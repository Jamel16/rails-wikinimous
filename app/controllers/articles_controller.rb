class ArticlesController < ApplicationController
  before_action :find, only: [:show, :edit, :update, :delete]

  def index
    @articles = Article.all
  end

  def show
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    if @article.save!
      redirect_to article_path(@article)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @article.update!(article_params)
      redirect_to article_path(@article)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def delete
    @article.destroy
    redirect_to articles_path, status: :see_other
  end

  private

  def article_params
    params.require(:article).permit(:title, :content)
  end

  def find
    @article = Article.find(params[:id])
  end
end
