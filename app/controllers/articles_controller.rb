class ArticlesController < ApplicationController
   
    def show
        @article = Article.find(params[:id])
    end
    
    def index
        @all_articles = Article.all
    end

    def new
    end

    def create
        @new_article = Article.new(params.require(:article).permit(:title, :description))
        @new_article.save
        redirect_to article_path(@new_article)
    end

end
