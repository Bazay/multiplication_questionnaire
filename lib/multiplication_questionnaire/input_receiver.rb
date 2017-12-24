module MultiplicationQuestionnaire
  class InputReceiver
    def fetch_integer
      fetch.to_i
    end

    def fetch
      gets.chomp
    end
  end
end
