class Character < ActiveRecord::Base
  has_one :game
  validates :name, presence: true

  after_create_commit { GameCharactersBroadcastJob.perform_now self, :joined }
  after_destroy { GameCharactersBroadcastJob.perform_now self, :left }
  after_destroy { CharacterBroadcastJob.perform_now self, :kicked }
  after_destroy :game_count_check
  after_create_commit :game_count_check

  def knowledge(characters)
    basic_knowledge + special_knowledge(characters)
  end

  def bad_guy?
    false
  end

  def message_for_bad_guy
    nil
  end

  def message_for_liberal_spy
    message_for_bad_guy
  end

  def message_for_percival
    nil
  end

  def message_for_merlin
    message_for_bad_guy
  end

  def game_count_check
    Game.find_by( id: self.game_id ).character_count_check
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
