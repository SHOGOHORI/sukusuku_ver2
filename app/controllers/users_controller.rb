class UsersController < ApplicationController
  before_action :set_user, only: [:profile_create, :update]

  def show
    @user = User.find(params[:id])
  end

  def profile_create
    @child = Child.new
  end

  def update
    @child = Child.new(child_params[:child])
    if @user.update(user_params) && @child.save
      redirect_to @user, notice: 'プロフィールを登録しました。'
    else
      render :profile_create, alert: '必須項目を入力願います。'
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :introduction)
  end

  def child_params
    params.require(:user).permit(child: [:nick_name])
  end

  def set_user
    @user = User.find(params[:id])
    redirect_to(root_url) unless current_user == @user
  end
end
