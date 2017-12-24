require_relative './printer'
require_relative './input_receiver'
require_relative './question_builder'

module MultiplicationQuestionnaire
  class QuestionRound
    attr_reader :round_number, :questions, :questions_per_round

    QUESTIONS_PER_ROUND = 10

    def initialize round_number, options = {}
      @printer = Printer.new
      @input_receiver = InputReceiver.new
      @round_number = round_number
      @questions_per_round = options[:questions_per_round] || QUESTIONS_PER_ROUND
      @questions = []
    end

    def play
      (1..questions_per_round).each do |question_number|
        build_question question_number
        ask_question
        show_question_summary
      end
    end

    def correct_count
      questions.select(&:answered?).select(&:correct?).count
    end

    def complete?
      questions.select(&:answered?).count == QUESTIONS_PER_ROUND
    end

    def current_question
      questions.last
    end

    def to_s
      "Round #{round_number}: #{correct_count} / #{questions_per_round}"
    end

    private

      def build_question question_number
        @questions << question_builder.build(question_number)
      end

      def ask_question
        @printer.print_question current_question
        current_question.answer_input = @input_receiver.fetch_integer
      end

      def show_question_summary
        @printer.show_question_summary current_question
      end

      def question_builder
        @question_builder ||= ::MultiplicationQuestionnaire::QuestionBuilder.new
      end
  end
end
