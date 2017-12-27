require_relative './printer'
require_relative './question_round'

module MultiplicationQuestionnaire
  class Questionnaire
    GAME_TITLE = 'Questionnaire Extraordinaire'
    NUMBER_OF_ROUNDS = 1

    def initialize
      @printer = Printer.new
      @rounds = []
      @start_time = Time.now
    end

    def play
      show_game_title
      (1..NUMBER_OF_ROUNDS).each do |round_number|
        build_round round_number
        play_round
        show_round_summary
      end
      show_game_summary
    end

    private

      def show_game_title
        @printer.print_title GAME_TITLE
      end

      def show_round_summary
        @printer.show_round_summary current_round
      end

      def show_game_summary
        @printer.show_game_summary @rounds, @start_time
      end

      def play_round
        current_round.play
      end

      def build_round round_number
        @rounds << ::MultiplicationQuestionnaire::QuestionRound.new(round_number)
      end

      def current_round
        @rounds.last
      end
  end
end
