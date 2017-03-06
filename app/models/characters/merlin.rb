class Merlin < Character
  def message_for_percival
    name
  end

  private
    def special_knowledge(characters)
      [
        "You are also MERLIN",
        "Try to be helpful without giving yourself away."
      ] + characters.collect(&:message_for_merlin).compact
    end
end