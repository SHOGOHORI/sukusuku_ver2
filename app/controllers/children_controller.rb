class ChildrenController < ApplicationController
  before_action :set_child, only: [:show, :edit, :update, :destroy, :delete_avater]
  before_action :redirect_root, only: [:edit, :update, :destroy]

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
    if @child.birthday < Date.today
      age = (Date.today.strftime('%Y%m%d').to_i - @child.birthday.strftime('%Y%m%d').to_i) / 10_000
      age += 12 if age < 0
      moon_age = (Date.today.strftime('%m%d').to_i - @child.birthday.strftime('%m%d').to_i) / 100
      moon_age += 12 if moon_age < 0
      @consultations = Consultation.where(child_age_moon_age: age * 12 + moon_age).recently.page(params[:page]).per(5)
      @votes = Vote.where(child_age_moon_age: age * 12 + moon_age).recently.page(params[:page]).per(5)
    else
      @consultations = Consultation.where(pregnant: 1).recently.page(params[:page]).per(5)
      @votes = Vote.where(pregnant: 1).recently.page(params[:page]).per(5)
    end
    respond_to do |format|
      format.html
      format.js
    end
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

  def delete_avater
    @child.remove_avatar!
    @child.save
    redirect_to edit_child_path(@child), notice: '画像を削除しました。'
  end

  private

  def child_params
    params.require(:child).permit(:nick_name, :birthday, :avatar, :comment, :child_number, :user_id)
  end

  def set_child
    @child = Child.find(params[:id])
  end

  def redirect_root
    redirect_to(root_url) unless current_user.id == @child.user_id
  end
end
