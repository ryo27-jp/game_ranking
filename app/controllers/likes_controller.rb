class LikesController < ApplicationController

  def create
    @game = Game.find(params[:game_id])
    current_user.like(@game)
    redirect_back(fallback_location: root_path)
  end

  def destroy
    @like = Like.find(params[:id]).game
    current_user.unlike(@like)
    redirect_back(fallback_location: root_path)
  end
end
