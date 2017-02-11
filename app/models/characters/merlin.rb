class Merlin < Character
  private
    def special_knowledge(characters)
      [
        "You are also MERLIN",
        "Try to be helpful without giving yourself away."
      ] + characters.collect(&:message_for_merlin).compact
    end
end
