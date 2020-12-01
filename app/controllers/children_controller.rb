class ChildrenController < ApplicationController
  before_action :set_child, only: [:edit, :update, :destroy]

  def edit
    @child = Child.find(params[:id])
  end

  def update
    if @child.update(child_params)
      redirect_to user_path(current_user), notice: '子どもの情報を更新しました。'
    else
      flash.now[:alert] = '必須項目を入力願います。'
      render :edit
    end
  end

  def destroy
    @child.destroy
    redirect_to user_path(current_user), flash: { success: '子供の情報を削除しました' }
  end

  def child_params
    params.require(:child).permit(:nick_name, :birthday, :avatar, :comment, :child_number)
  end

  def set_child
    @child = Child.find(params[:id])
    redirect_to(root_url) unless current_user.id == @child.user_id
  end
end
