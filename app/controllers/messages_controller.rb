class MessagesController < ApplicationController
    before_action :set_message!, only: [:show]
    before_action :set_chat!
    before_action :set_user!, only: [:show]
    before_action :set_product!

    def index
    end


    def new
        @message = @chat.messages.build
        @messages = Message.all
    end

    def message_all
        
    end

    
    def create
        @message = @chat.messages.build message_params
        @message.writer = current_user.id
        if Message.find_by(chat_id: @chat.id).present?
            if Message.find_by(chat_id: @chat.id).writer == current_user.id
                @message.recipient = Message.find_by(chat_id: @chat.id).recipient
            else
                @message.recipient = Message.find_by(chat_id: @chat.id).writer
            end
        else
            @message.recipient = @product.salesman
        end
        

        if @message.save
            flash[:alert] = "Успішно створено"
            redirect_to new_product_message_path(@product)
        else
            flash[:alert] = "Успішно"
            render :new
        end
      end


private


def message_params
    params.require(:message).permit(:text)
  end

  def chat_params
    params.require(:chat).permit(:product_id)
  end

def set_message!
    @messages = Message.all
end

def set_product!
    @product = Product.find(params[:product_id])
end

def set_chat!

        
    @message = Message.find_by(writer: current_user.id, recipient: Product.find(params[:product_id]).salesman)
        if Chat.find(@message.chat_id).product_id.present?
            if Chat.find(@message.chat_id).product_id == params[:product_id]
                @chat = Chat.find_by(product_id: params[:product_id])
            else
                @chats = Chat.new
                @chats.product_id = params[:product_id]
                @chats.save
                @chat = Chat.find_by(product_id: params[:product_id])
            end
        end

end

def set_user!
    @user = User.all
end

def product_and_message?
@product.id == @message.product_id
end




end