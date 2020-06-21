class ArticlesController < ApplicationController
  def new
  end

  def create
    # Test without db
    # render plain: params[:article].inspect
    
    # Initialize model with desired attributes
    # These are mapped to their respective db columns
    @article = Article.new(params[:article])
    # A for Article is class name. new instantiates a new instance
    
    @article.save  # Save in db
    redirect_to @article  # Redirect to show action
  end
end
