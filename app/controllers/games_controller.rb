class GamesController < ApplicationController
  before_action :only_administrator!, only: [:new, :create]


  def index
    @games = Game.all
    @services = Service.all
  end

  def show
    @service = @game.services.build
    @services = Service.all
  end

  def new
    @game = Game.new
  end

  def create
    @game = Game.new game_params
    if @game.save
      flash[:alert] = "Успішно створено"
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def game_params
    params.require(:game).permit(:name)
  end


  def only_administrator!
    if user_administrator?
    else
      flash[:alert] = "Відмовленно в доступі"
      redirect_to root_path
    end
  end


end
