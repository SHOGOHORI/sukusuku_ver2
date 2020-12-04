class ConsultationsController < ApplicationController

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
  end

  private

  def consultation_params
    params.require(:consultation).permit(:content, :title, :user_id, { images: [] })
  end
end
