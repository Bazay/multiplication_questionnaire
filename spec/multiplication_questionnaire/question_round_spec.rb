require_relative './../../lib/multiplication_questionnaire/question_round'

RSpec.describe MultiplicationQuestionnaire::QuestionRound do
  subject { described_class.new round_size }

  let(:round_size) { rand(9) + 1 }

  its(:questions) { is_expected.to have(10).questions }
end
