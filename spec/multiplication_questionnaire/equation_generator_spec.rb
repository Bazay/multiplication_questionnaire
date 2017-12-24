require_relative './../../lib/multiplication_questionnaire/equation_generator'

RSpec.describe MultiplicationQuestionnaire::EquationGenerator do
  let(:generator) { described_class.new equation_params }
  let(:equation_params) { { minimum_value: minimum_value, maximum_value: maximum_value, equation_type: equation_type } }
  let(:minimum_value) { 12 }
  let(:maximum_value) { 12 }
  let(:equation_type) { described_class::EQUATION_TYPE_MULTIPLY }

  describe '#generate' do
    subject { generator.generate }

    # Since we're min/max = 12 we can guarantee results. However, ths is bad testing and should facilitate randomisation
    its(:first_value) { is_expected.to eq 12 }
    its(:second_value) { is_expected.to eq 12 }
    its(:answer) { 12*12 }
  end
end
