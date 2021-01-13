class ConsultationsController < ApplicationController
  before_action :set_consultation, only: [:edit, :update, :destroy, :reception_closed]
  impressionist actions: [:show]

  def new
    @consultation = Consultation.new
  end

  def create
    @consultation = Consultation.new(consultation_params)
    @consultation.child_age_moon_age = @consultation.age.to_i * 12 + @consultation.moon_age.to_i
    if @consultation.save
      redirect_to consultation_url(@consultation), notice: '投稿しました。'
    else
      flash.now[:alert] = '投稿に失敗しました'
      render :new
    end
  end

  def show
    @consultation = Consultation.find(params[:id])
    impressionist(@consultation, nil, unique: [:session_hash])
    @comment = ConsultationComment.new
    @comments = @consultation.consultation_comments.recently.page(params[:page]).per(5)
    @reply = ConsultationCommentReply.new
    store_location
    respond_to do |format|
      format.html
      format.js
    end
  end

  def index
    store_location
    respond_to do |format|
      format.html
      format.js
    end
  end

  def edit
    @category = Category.find_by(id: @consultation.category_id)
  end

  def update
    @category = Category.find_by(id: @consultation.category_id)
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

  def reception_closed
    @consultation.reception_closed = true
    @consultation.save
    redirect_to @consultation
  end

  private

  def consultation_params
    params.require(:consultation).permit(:content, :title, :user_id, :category_id, :age, :moon_age, :pregnant, { image: [] })
  end

  def set_consultation
    @consultation = Consultation.find(params[:id])
    redirect_to(root_url) unless current_user.id == @consultation.user_id
  end

  def store_location
    session[:forwarding_url] = request.original_url if request.get?
  end

  def consultations_path_with_search_params
    URI(request.referer).path == '/sonsultations' ? request.referer : items_path
  end
end
