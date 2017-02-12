class Game < ActiveRecord::Base
  has_many :characters

  def self.default_scope
    where(arel_table[:created_at].gt(DateTime.now - 1.day))
  end

  def self.build
    create(code: new_code)
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
