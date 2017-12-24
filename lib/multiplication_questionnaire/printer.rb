module MultiplicationQuestionnaire
  class Printer
    def print_title title
      puts ''
      puts '-' * title.length
      puts title.upcase
      puts '-' * title.length
      puts ''
    end

    def print_question question
      puts question.to_s
      print 'Your Answer: '
    end

    def show_question_summary question
      puts question.correct? ? '(correct)' : '(incorrect)'
    end

    def show_round_summary question_round
      puts question_round.to_s
    end

    def show_game_summary question_rounds
      print_title 'Game Summary'
      question_rounds.each do |question_round|
        show_round_summary question_round
      end
      puts "Overall score: #{sum_object_array(question_rounds, :correct_count)} / #{sum_object_array(question_rounds, :questions_per_round)}"
    end

    private

      def sum_object_array object_array, method
        object_array.inject(0) { |sum, object| sum += object.send(method) }
      end
  end
end
