class ReviewsController < ApplicationController
    before_action :set_review!, only: [:show]
    before_action :set_product!, only: [:new, :create]
    before_action :set_user!, only: [:show]

    def index
    end


    def new
        @review = @product.reviews.build
    end

    
    def create
        @review = @product.reviews.build review_params
        @review.salesman = @product.salesman
        @review.buyer = current_user.id
        if @review.save
            flash[:alert] = "Успішно створено"
            redirect_to product_path(@product)
        else
            flash[:alert] = "Успішно"
            render :new
        end
      end


private


def review_params
    params.require(:review).permit(:text, :grade, :product_id, :buyer, :salesman)
  end

def set_review!
    @review = Review.find params[:id]
end

def set_product!
    @product = Product.find(params[:product_id])
end

def set_user!
    @user = User.all
end



end