class Game < ActiveRecord::Base
  has_many :characters
  has_one :owner, class_name: "Character"
  validates_presence_of :bad_number

  after_update { GameBroadcastJob.perform_now :updated, self }

  def self.default_scope
    where(arel_table[:created_at].gt(DateTime.now - 1.day))
  end

  def self.build
    create(code: new_code)
  end

  def special_character_hash
    {
      special_good: special_good,
      special_bad: special_bad,
      bad_number: bad_number
    }.compact
  end

  def character_count_check
    GameBroadcastJob.perform_now :updated, self
  end

  def is_owner? character
    puts self.owner
    puts character
    self.owner == character
  end

  private
    def self.new_code
      letters = ('a'..'z').to_a
      allowed_code = nil
      loop do
        allowed_code = "#{letters.sample}#{letters.sample}#{letters.sample}#{letters.sample}"
        unless where(code: allowed_code).present?
          break
        end
      end
      allowed_code
    end
end
