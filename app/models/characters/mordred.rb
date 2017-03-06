class Mordred < BadGuy
  def message_for_merlin
    "One bad guy is unknown to you."
  end

  private
    def special_knowledge(characters)
      characters.collect(&:message_for_bad_guy).compact + [
        "You are also MORDRED.",
        "Merlin doesn't know you're bad."
      ]
    end
end
