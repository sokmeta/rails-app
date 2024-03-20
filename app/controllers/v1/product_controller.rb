class V1::ProductController < ApplicationController
    def index 
        @products = Product.all

        render json: @products, status: :ok
    end

    def create
        @product = Product.new(product_params)
    
        if @product.save
          render json: @product, status: :created
        else
          render json: @product.errors, status: :unprocessable_entity
        end
    end
    
    private
    
    def product_params
        params.require(:product).permit(:name, :description, :price)
    end

end
