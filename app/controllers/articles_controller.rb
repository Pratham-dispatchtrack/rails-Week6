class ArticlesController < ApplicationController
    before_action :set_article, only: [:show, :update, :edit, :destroy]
   
    def show
    end
    
    def index
        @all_articles = Article.all
    end

    def new
        @article = Article.new
    end

    def edit

    end

    def create
        @article = Article.new(article_params)
        if @article.save
            flash[:notice] = "Article was created successfully. "
            redirect_to article_path(@article)
        else
            render 'new', status: 422
        end
    end

   

    def update
        if @article.update(article_params)
            flash[:notice] = "Article was updated successfully"
            redirect_to @article
        else
            render 'edit', status: 422
        end

    end

    def destroy
        @article.destroy
        redirect_to articles_path
    end

    private
    def set_article
        @article = Article.find(params[:id])
    end

    def article_params
        params.require(:article).permit(:title, :description)
    end







end
