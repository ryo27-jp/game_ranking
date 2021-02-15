class MypagesController < ApplicationController
  before_action :require_login
  layout 'mypage'

  def show
    @user = User.find(current_user.id)
  end

  def edit
    @user = User.find(current_user.id)
  end

  def update
    @user = User.find(current_user.id)

    @user.update(mypage_params)
    if @user.save
      redirect_to mypage_path, success: 'プロフィールを更新しました'
    else
      flash.now['danger'] = 'プロフィールの更新に失敗しました'
      render :edit
    end
  end

  private

  def mypage_params
    params.require(:user).permit(:name, :email, :avatar, :avatar_cache)
  end

end
