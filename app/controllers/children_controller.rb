class ChildrenController < ApplicationController
  before_action :set_user, only: [:edit, :update]

  def edit
    @children = @user.children
  end

  def update
    if @user.update(user_params)
      redirect_to @user, notice: '子どもの情報を更新しました。'
    else
      flash.now[:alert] = '必須項目を入力願います。'
      render :edit
    end
  end

  def user_params
    params.require(:user).permit(children_attributes: [:nick_name, :birthday, :child_number, :_destroy])
  end

  def set_user
    @user = User.find(params[:id])
    redirect_to(root_url) unless current_user == @user
  end
end
