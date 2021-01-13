class ConsultationStocksController < ApplicationController

  def create
    @stock = current_user.ConsultationStocks.create(consultation_id: params[:consultation_id])
    redirect_back(fallback_location: root_path)
  end

  def destroy
    @stock= ConsultationStocks.find_by(consultation_id: params[:consultation_id], user_id: current_user.id)
    @stock.destroy
    redirect_back(fallback_location: root_path)
  end
end