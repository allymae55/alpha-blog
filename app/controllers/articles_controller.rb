class ArticlesController < ApplicationController
    def show
        @article = Article.find(params[:id])
    end

    def index
        @articles = Article.all
    end
    
    def new

    end

    def create
        #render plain: params[:article]
        @article = Article.new(params.require(:article).permit(:title, :description))
        @article.save
        #render plain: @article.inspect
        #redirect_to  article_path(@article)
        #shortcut to above line ^
        redirect_to  @article
    end
end