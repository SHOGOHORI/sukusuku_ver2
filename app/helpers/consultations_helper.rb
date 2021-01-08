module ConsultationsHelper
  def consultation_tag(consultation)
    if consultation.pregnant
      '妊娠中の相談'
    elsif consultation.child_age_moon_age
      "#{consultation.child_age_moon_age / 12}歳#{consultation.child_age_moon_age % 12}ヶ月の相談"
    end
  end
end
