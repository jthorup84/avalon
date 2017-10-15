class SecretHitler < BadGuy
  def message_for_bad_guy
    "#{name} is Secret Hitler."
  end

  private
    def basic_knowledge
      [
        "You're a bad guy."
      ]
    end

    def special_knowledge(characters)
      messages = [
        "You're also Secret Hitler."
      ]

      number_of_bad_guys = characters.count(&:bad_guy?)
      if number_of_bad_guys > 1
        messages + [
          "There are #{number_of_bad_guys} other bad guys.",
          "They know who you are."
        ]
      else
        messages + characters.collect(&:message_for_bad_guy).compact
      end
    end
end
