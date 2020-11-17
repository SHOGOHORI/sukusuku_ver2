class UsersController < ApplicationController
  before_action :set_user, only: [:profile_create, :update]
  skip_before_action :noname_user, only: [:profile_create, :update]

  def show
    @user = User.find(params[:id])
  end

  def profile_create
    @children = @user.children.build
  end

  def update
    if @user.update(user_params)
      redirect_to @user, notice: 'プロフィールを登録しました。'
    else
      flash.now[:alert] = '必須項目を入力願います。'
      render :profile_create
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :introduction, children_attributes: [:nick_name, :birthday, :child_number])
  end

  def child_params
    params.require(:user).permit(child: [:nick_name, :birthday, :child_number, :user_id])
  end

  def set_user
    @user = User.find(params[:id])
    redirect_to(root_url) unless current_user == @user
  end
end
