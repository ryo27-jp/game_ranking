class GamesController < ApplicationController
  # before_action :require_login

  def index
    @games = Game.all
  end

  def show
    @game = Game.find(params[:id])

    @reviews = @game.reviews
    @review = Review.new
  end

  def new
    @game = Game.new
  end

  def create
    @game = Game.new(game_params)
    if @game.save
      redirect_to games_path notice: '作成しました'
    else
      flash.now[:danger] = '投稿に失敗しました。'
      render :new
    end
  end


  def edit
  end

  def destroy
    @game = Game.find(params[:id])
    @game.destroy!
    redirect_to games_path, success: '投稿を削除しました。'
  end

  private

  def game_params
    params.require(:game).permit(:title, :description, :release_date, :production)
  end
end
