class TransactionsController < ApplicationController


    before_action :set_product!, only: [:new, :create]


    def index
    end


    def new
            @transaction = @product.transactions.build
            if User.find(current_user.id).balance.to_i > @product.price.to_i and not @product.buyer.present?
                @product.buyer = current_user.id
                @user = User.find(@product.buyer)
                @user.balance = (@user.balance.to_i - @product.price.to_i)
                @product.save
                @user.save
                flash[:alert] = "Транзакція проведена успішно"
                redirect_to product_path(@product)
            end
    end

    
    def create
        @transaction = @product.transactions.build transaction_params
        @product.buyer = current_user.id
        @user = User.find(@product.salesman)
        @user.balance = (@user.balance.to_i + @product.price.to_i)
        if @transaction.save
            @product.save
            @user.save
            flash[:alert] = "Транзакція проведена успішно"
            redirect_to product_path(@product)
        else
            flash[:alert] = "Помілка транзакції"
            render :new
        end
      end


private


def transaction_params
    params.require(:transaction).permit(:cvv, :date, :owner, :card)
  end

def set_transaction!
    @transaction = Transaction.find params[:id]
end

def set_product!
    @product = Product.find(params[:product_id])
end



end