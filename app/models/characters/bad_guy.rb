class BadGuy < Character
  def knowledge(characters)
    basic_knowledge + characters.collect(&:message_for_bad_guy).compact
  end

  def message_for_bad_guy
    "#{name} is a bad guy."
  end

  private
    def basic_knowledge
      [
        "You're a bad guy."
      ]
    end
end
