class ArticlesController < ApplicationController
    before_action :set_article, only: [:edit, :update, :show, :destroy]
    
  def new
      @article = Article.new
  end
  
  def create
      @article = Article.new(article_params)
      if @article.save
          flash[:success] = "Article was successfully created"
          redirect_to article_path(@article)
          #render 'show'
      else
          render 'new'
      end
  end
  
  def index
      @articles = Article.all
  end
  
  def show
  end
  
  def edit
  end
  
  def update
      if @article.update(article_params)
          flash[:success] = "Article updated successfully"
          redirect_to article_path(@article)
      else
          render :edit
      end
  end
  
  def destroy
     @article.destroy
     flash[:success] = "Article was deleted"
     redirect_to article_path
  end
     
  
  private
  def set_article
      @article = Article.find(params[:id])
  end
  
  def article_params
     params.require(:article).permit(:title, :description) 
  end
  
end