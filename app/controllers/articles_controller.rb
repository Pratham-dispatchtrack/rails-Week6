class ArticlesController < ApplicationController
   
    def show
        @article = Article.find(params[:id])
    end
    
    def index
        @all_articles = Article.all
    end
    

end
