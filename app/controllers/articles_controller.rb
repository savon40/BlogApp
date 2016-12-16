class ArticlesController < ApplicationController
  def index
  end
  
  def new
    @article = Article.new
  end
  
  def create
    @article = Article.new(article_params)
    if @article.save
      flash[:success] = 'Article has been created'
      redirect_to articles_path
    else 
      #flash.now means dont wait for a new page to render before showing - it shows right away - flash puts it in the 'queue' and shows it after redirect
      flash.now[:danger] = 'Article has not been created'
      render :new
    end
  end
  
  private 
    def article_params
      params.require(:article).permit(:title, :body)
    end
end
