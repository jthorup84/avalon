class LiberalSpy < Character
  def message_for_bad_guy
    "#{name} is a bad guy."
  end

  private
    def basic_knowledge
      [
        "You're a bad guy."
      ]
    end

    def special_knowledge(characters)
      [
        "You're a spy!",
        "YOU'RE ACTUALLY A GOOD GUY.",
        "You only appear as a bad guy.",
        "You win if the good guys win."
      ] + characters.collect(&:message_for_liberal_spy).compact
    end
end
