class Oberon < BadGuy
  def message_for_bad_guy
    "One bad guy is unknown to you."
  end

  def message_for_merlin
    "#{name} is a bad guy."
  end

  private
    def special_knowledge(characters)
      [
        "You are also OBERON.",
        "You don't know who else is bad.",
        "Bad guys don't know you're bad."
      ]
    end
end
