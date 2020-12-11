class ConsultationsController < ApplicationController
  before_action :set_consultation, only: [:edit, :update, :destroy]

  def new
    @consultation = Consultation.new
  end

  def create
    @consultation = Consultation.new(consultation_params)
    if @consultation.save
      redirect_to consultation_url(@consultation), notice: '投稿しました。'
    else
      flash.now[:alert] = '投稿に失敗しました'
      render :new
    end
  end

  def show
    @consultation = Consultation.find(params[:id])
    @user = User.find_by(id: @consultation.user_id)
    @category = Category.find_by(id: @consultation.category_id)
    @comment = ConsultationComment.new
    @comments = @consultation.consultation_comments.recently.page(params[:page]).per(5)
  end

  def edit; end

  def update
    if @consultation.update(consultation_params)
      redirect_to @consultation, notice: '更新しました。'
    else
      flash.now[:alert] = '必須項目を入力願います。'
      render :edit
    end
  end

  def destroy
    @consultation.destroy
    redirect_to root_path, notice: '削除しました'
  end

  private

  def consultation_params
    params.require(:consultation).permit(:content, :title, :user_id, :category_id, :child_age, :child_moon_age, :pregnant, { image: [] })
  end

  def set_consultation
    @consultation = Consultation.find(params[:id])
    redirect_to(root_url) unless current_user.id == @consultation.user_id
  end
end
