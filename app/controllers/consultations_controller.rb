class ConsultationsController < ApplicationController


  def new
    @consultation = Consultation.new
  end

  def create

  end

  private

  def question_params
    params.require(:question).permit(:content, :title)
  end
end
