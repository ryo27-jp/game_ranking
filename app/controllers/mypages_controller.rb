class MypagesController < ApplicationController
  before_action :require_login
  layout 'mypage'

  def show
    @user = User.find(current_user.id)
  end
end
