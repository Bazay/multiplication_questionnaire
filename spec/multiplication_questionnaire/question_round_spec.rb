require_relative './../../lib/multiplication_questionnaire/question_round'

RSpec.describe MultiplicationQuestionnaire::QuestionRound do
  subject { round }

  let(:round) { described_class.new 1, question_round_options }
  let(:question_round_options) { { questions_per_round: questions_per_round } }
  let(:questions_per_round) { rand(9) + 1 }

  its(:questions_per_round) { is_expected.to eq questions_per_round }

  describe '#play' do
    subject { round.play }

    before do
      allow(round).to receive(:ask_question)
      allow(round).to receive(:show_question_summary)
    end

    it { expect { subject }.to change { round.questions.count }.by questions_per_round }
  end
end
