class ServicesController < ApplicationController
    before_action :set_service!, only: [:show]
    before_action :set_game!, only: [:new, :create]
    before_action :only_administrator!, only: [:new, :create]
    before_action :set_user!, only: [:show]
    before_action :set_product!, only: [:show]
    before_action :set_review!, only: [:show]
    def index 
    end

    def show

    end

    def new
        @service = @game.services.build
    end

    def create 
        @service = @game.services.build service_params
        if @service.save
            flash[:alert] = "Успішно створено"
            redirect_to root_path
        else
            render :new
        end
    end

    private
    def service_params
        params.require(:service).permit(:name).to_h
      end
    
    def set_game!
        @game = Game.find(params[:game_id])
    end

    def set_service!
        @service = Service.find params[:id]
    end

    def set_product!
        @product = Product.find_by(service_id: @service.id)
    end

    

    def set_user!
        @user = User.all
    end

    def set_review!
        @reviews = Review.all
    end

      def only_administrator!
        if user_administrator?
        else
            flash[:alert] = "Відмовленно в доступі"
            redirect_to root_path
        end
      end

end