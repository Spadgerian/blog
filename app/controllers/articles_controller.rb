class ArticlesController < ApplicationController
  skip_forgery_protection 

  def index
    @articles = Article.all
  end

  def show
    @article = Article.find(params[:id])
  end
  
  def new
    @article = Article.new
  end

  def edit
    @article = Article.find(params[:id])
  end

  def create
    # Test without db
    # render plain: params[:article].inspect
    
    # Initialize model with desired attributes
    # These are mapped to their respective db columns
    @article = Article.new(article_params)  # params defined below
    # A for Article is class name. new instantiates a new instance

    if @article.save  # Save in db
      redirect_to @article  # Redirect to show action
    else
      render 'new'
    end
  end

  # Set the require and permit params
  private
    def article_params
      params.require(:article).permit(:title, :text)
    end

end
