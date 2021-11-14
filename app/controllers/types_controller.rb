class TypesController < ApplicationController
    before_action :set_type, only: [:show, :edit, :update, :destroy]

    def index
        @types = Type.all
    end

    def show   
    end

    def new
        @type = Type.new
    end

    def edit
    end

    def create
        @type = Type.new(type_params)
        sleep 2
        respond_to do |format|
            if @type.save!
                format.html { redirect_to types_path, notice: 'Type created!' }
            else
                format.html { render :new, status: :unprocessable_entity }
            end
        end
    end

    def update
        respond_to do |format|
            if @type.update!(type_params)
                format.html { redirect_to types_path, notice: 'Type updated!' }
            else
                format.html { render :edit, status: :unprocessable_entity }
            end
        end
    end

    def destroy
        respond_to do |format|
            if @type.destroy!
                format.html { redirect_to types_path, notice: 'Type deleted!' }
            else
                format.html { redirect_to types_path, notice: 'Type could not be deleted' }
            end
        end
    end     
    
    private

    def set_type
        @type = Type.find(params[:id])
    end

    def type_params
        params.require(:type).permit(:name)
    end
end