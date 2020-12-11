class ChildrenController < ApplicationController
  before_action :set_child, only: [:edit, :update, :destroy]

  def new
    @child = Child.new
  end

  def create
    @child = Child.new(child_params)
    if @child.save
      redirect_to user_path(@child.user_id), notice: '子どもの情報を登録しました。'
    else
      flash.now[:alert] = '必須項目を入力願います。'
      render :new
    end
  end

  def show
    @child = Child.find(params[:id])
  end

  def edit; end

  def update
    if @child.update(child_params)
      redirect_to current_user, notice: '子どもの情報を更新しました。'
    else
      flash.now[:alert] = '必須項目を入力願います。'
      render :edit
    end
  end

  def destroy
    @child.destroy
    redirect_to user_path(current_user), notice: '子供の情報を削除しました'
  end

  private

  def child_params
    params.require(:child).permit(:nick_name, :birthday, :avatar, :comment, :child_number, :user_id)
  end

  def set_child
    @child = Child.find(params[:id])
    redirect_to(root_url) unless current_user.id == @child.user_id
  end
end
