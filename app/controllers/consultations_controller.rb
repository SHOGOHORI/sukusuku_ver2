class ConsultationsController < ApplicationController


  def new
    @consultation = Consultation.new
  end

  def create
    @consultation = current_user.consultations.build(consultation_params)
    if @consultation.save
      redirect_to consultation_url(@consultation), flash: { success: '投稿しました' }
    else
      render :new, flash: { danger: '投稿に失敗しました' }
    end
  end

  def show
    @consultation = Consultation.find(params[:id])
  end

  private

  def consultation_params
    params.require(:consultation).permit(:content, :title)
  end
end
