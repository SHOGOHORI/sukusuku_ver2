class ConsultationStocksController < ApplicationController

  def create
    @consultation = Consultation.find(params[:consultation_id])
    @stock = current_user.consultation_stocks.create(consultation_id: params[:consultation_id])
    respond_to do |format|
      format.html
      format.js
    end
  end

  def destroy
    @consultation = Consultation.find(params[:consultation_id])
    @stock= ConsultationStock.find_by(consultation_id: params[:consultation_id], user_id: current_user.id)
    @stock.destroy
    respond_to do |format|
      format.html
      format.js
    end
  end
end
