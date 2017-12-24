module MultiplicationQuestionnaire
  class Question
    attr_reader :question_number, :first_value, :second_value, :operation
    attr_accessor :answer_input

    def initialize question_number:, first_value:, second_value:, operation:;
      @question_number = question_number
      @first_value = first_value
      @second_value = second_value
      @operation = operation
      @answer_input = nil
    end

    def answer
      first_value.send operation, second_value
    end

    def correct?
      answer == answer_input
    end

    def answered?
      answer_input
    end

    def to_s
      "Q#{question_number}. #{first_value} x #{second_value} = ?"
    end
  end
end
