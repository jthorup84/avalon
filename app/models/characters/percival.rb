class Percival < Character
  private
    def special_knowledge(characters)
      [
        "You are also PERCIVAL",
        "Try to be supportive of Merlin without exposing him.",
        "One of the following players is Merlin:"
      ] + characters.collect(&:message_for_percival).compact
    end
end
