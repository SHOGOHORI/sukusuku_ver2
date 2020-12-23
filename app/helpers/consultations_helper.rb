module ConsultationsHelper
  def consultation_tag(consultation)
    if consultation.pregnant
      '妊娠中の相談'
    elsif consultation.moon_age
      "#{consultation.moon_age / 12}歳#{consultation.moon_age % 12}ヶ月の相談"
    end
  end
end
