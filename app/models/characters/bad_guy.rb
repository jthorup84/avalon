class BadGuy < Character
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
      characters.collect(&:message_for_bad_guy).compact
    end
end
