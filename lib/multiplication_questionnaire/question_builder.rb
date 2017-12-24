require_relative './question'

module MultiplicationQuestionnaire
  class QuestionBuilder
    def initialize params = {}
      @question_number = params[:question_number] || nil
      @minimum_value = params[:minimum_value] || 1
      @maximum_value = params[:maximum_value] || 12
      @operation = params[:operation] || 'multiply'
    end

    def build question_number
      ::MultiplicationQuestionnaire::Question.new question_number: question_number, first_value: generate_value, second_value: generate_value, operation: '*'
    end

    private

      def generate_value
        rand @minimum_value..@maximum_value
      end
  end
end
