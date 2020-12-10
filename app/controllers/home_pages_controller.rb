class HomePagesController < ApplicationController

  def home
    @consultations = Consultation.all.page(params[:page]).per(5)
  end

  def help
  end

  def privacy
  end
end
