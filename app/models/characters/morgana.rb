class Morgana < BadGuy
  def message_for_percival
    name
  end

  private
    def special_knowledge(characters)
      characters.collect(&:message_for_bad_guy).compact + [
        "You are also MORGANA.",
        "Percival thinks you might be Merlin."
      ]
    end
end