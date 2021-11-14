class CategoriesController < ApplicationController
    before_action :set_category, only: [:show, :edit, :update, :destroy, :endpoint]

    def index
        @categories = Category.all
    end

    def show   
    end

    def new
        @category = Category.new
        @categories = Category.all
    end

    def edit
        @categories = Category.all
    end

    def create
        @category = Category.new(category_params)
        sleep 2
        respond_to do |format|
            if @category.save!
                format.html { redirect_to categories_path, notice: 'Category created!' }
            else
                format.html { render :new, status: :unprocessable_entity }
            end
        end
    end

    def update
        respond_to do |format|
            if @category.update!(category_params)
                format.html { redirect_to categories_path, notice: 'Category updated' }
            else
                format.html { render :edit, status: :unprocessable_entity }
            end
        end
    end

    def destroy
        respond_to do |format|
            if @category.destroy!
                format.html { redirect_to categories_path, notice: 'Category deleted!' }
            else
                format.html { redirect_to categories_path, notice: 'Category could not be deleted' }
            end
        end
    end     

    def endpoint
        @category = Category.find(params[:id])
        render json: @category.to_json(include: [:sub_categories, :bookmarks])
    end
    
    private

    def set_category
        @category = Category.find(params[:id])
    end

    def category_params
        params.require(:category).permit(:name, :visibility, :category_id)
    end
end
