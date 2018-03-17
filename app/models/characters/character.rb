class Character < ActiveRecord::Base
  has_one :game
  validates :name, presence: true

  after_create_commit { GameCharacterBroadcastJob.perform_now self, :joined }
  after_destroy { GameCharacterBroadcastJob.perform_now self, :left }
  after_destroy { CharacterBroadcastJob.perform_now self, :kicked }

  def knowledge(characters)
    basic_knowledge + special_knowledge(characters)
  end

  def bad_guy?
    false
  end

  def message_for_bad_guy
    nil
  end

  def message_for_percival
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
