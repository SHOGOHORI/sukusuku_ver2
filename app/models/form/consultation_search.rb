class ConsultationSearch
  include ActiveModel::Model
  include Ransack::Search
  attr_accessor :age, :moon_age

  def execute
    Consultation.ransack(params[:q][:age_lteq].to_i * 12 + params[:q][:moon_age_lteq].to_i).result
  end
end
