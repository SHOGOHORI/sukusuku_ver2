class HomePagesController < ApplicationController
  def home
    @consultations = Consultation.all
    @consultations = Kaminari.paginate_array(@consultations).page(params[:page])
  end

  def help
  end

  def privacy
  end
end
