class BadGuy < Character
  def message_for_bad_guy
    "#{name} is a bad guy."
  end

  def bad_guy?
    true
  end

  private
    def basic_knowledge
      [
        "You're a bad guy."
      ]
    end

    def special_knowledge(characters)
      messages = characters.collect(&:message_for_bad_guy).compact
      if characters.any?{|c| c.class == LiberalSpy}
        messages << "One of the bad guys is actually a good guy."
      end
      messages
    end
end
