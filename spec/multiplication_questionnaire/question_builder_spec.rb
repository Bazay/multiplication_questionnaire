require_relative './../../lib/multiplication_questionnaire/question_builder'

RSpec.describe MultiplicationQuestionnaire::QuestionBuilder do
  let(:builder) { described_class.new equation_params }
  let :equation_params do
    { minimum_value: minimum_value, maximum_value: maximum_value }
  end
  let(:question_number) { rand(1..10) }
  let(:minimum_value) { rand(1..12) }
  let(:maximum_value) { rand(1..12) }

  describe '#build' do
    subject { builder.build question_number }

    it { is_expected.to be_kind_of MultiplicationQuestionnaire::Question }
  end
end
