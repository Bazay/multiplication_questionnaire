require_relative './multiplication_questionnaire/questionnaire'

module MultiplicationQuestionnaire
  def self.start
    questionnaire = ::MultiplicationQuestionnaire::Questionnaire.new
    questionnaire.play
  end
end
