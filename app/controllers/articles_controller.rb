class ArticlesController < ApplicationController
  def show
    @article = Article.find(params[:id])
  end
  
  
  def new
  end

  def create
    # Test without db
    # render plain: params[:article].inspect
    
    # Initialize model with desired attributes
    # These are mapped to their respective db columns
    @article = Article.new(article_params)  # params defined below
    # A for Article is class name. new instantiates a new instance

    @article.save  # Save in db
    redirect_to @article  # Redirect to show action
    
    # Set the require and permit params
    private
      def article_params
        params.require(:article).permit(:title, :text)
      end
  end
end
