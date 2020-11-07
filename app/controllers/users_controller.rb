class UsersController < ApplicationController
  before_action :set_user, only: [:profile_create, :update]

  def show
    @user = User.find(params[:id])
  end

  def profile_create
  end

  def update
    if @user.update(user_params)
      redirect_to @user, notice: 'プロフィールを登録しました。'
    else
      render root_path
    end
  end

  private

  def user_params
    params.require(:user).permit(:avatar, :name, :email, :introduction, :password,
                                 :password_confirmation)
  end

  def set_user
    @user = User.find(params[:id])
    redirect_to(root_url) unless current_user == @user
  end
end
