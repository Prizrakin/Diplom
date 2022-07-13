class ProductsController < ApplicationController
    before_action :set_service!, only: [:new, :create]
    before_action :set_product!, only: [:show, :edit, :update, :translation, :translationp]
    before_action :signed_in!, only: [:new, :create]
    before_action :set_message!, only: [:show]



    def index 

    end

    def edit
        
    end

    def bought
        @reviews = Review.all
        if user_signed_in?
            @product = Product.where(buyer: current_user.id)
        end
    end

    def sold
        @reviews = Review.all
        if user_signed_in?
            @product = Product.where(salesman: current_user.id)
        end
    end

    def translation
        @product.buyer = current_user.id
        @user = User.find(@product.buyer)
        @user.balance = (@user.balance.to_i - @product.price.to_i)
        @product.save
        @user.save
        redirect_to product_path(@product)
    end

    def translationp
        @product.active = false
        @user = User.find(@product.salesman)
        @user.balance = (@user.balance.to_i + @product.price.to_i)
        @product.save
        @user.save
        redirect_to product_path(@product)
    end

    def message_all
        @message = Message.all
    end

    def update
        if @product.update product_params
            redirect_to product_path
        else
            render :new
        end
    end

    def show
        @reviews = Review.all
    end

    


    def new
        @product = @service.products.build
    end

    def create 
        @product = @service.products.build product_params
        @product.active = true
        @product.salesman = current_user.id
        if @product.save
            redirect_to service_path(@product.service_id)
        else
            render :new
        end
    end






    private
    def product_params
        params.require(:product).permit(:active, :price, :long_description, :short_description, :salesman)
      end
    
    def set_product!
        @product = Product.find params[:id]
    end

    def set_service!
        @service = Service.find params[:service_id]
      end

    def set_message!
        @messages = Message.all
    end

    


    def signed_in!
        if user_signed_in?
        else

            redirect_to service_path(@service)
        end
    end




end