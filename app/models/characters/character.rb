class Character < ActiveRecord::Base
  def knowledge(characters)
    basic_knowledge + special_knowledge(characters)
  end

  def message_for_bad_guy
    nil
  end

  def message_for_merlin
    message_for_bad_guy
  end

  private
    def basic_knowledge
      [
        "You're a good guy."
      ]
    end

    def special_knowledge(characters)
      []
    end
end
