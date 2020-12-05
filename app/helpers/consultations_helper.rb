module ConsultationsHelper

  def consultation_tag(consultation)
    if consultation.pregnant
      '妊娠中の相談'
    else
      "#{consultation.child_age}歳#{consultation.child_moon_age}ヶ月の相談"
    end
  end
end
