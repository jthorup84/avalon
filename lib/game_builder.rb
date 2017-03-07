class GameBuilder
  attr_accessor :characters

  def initialize(game)
    @characters = game.characters
  end

  def assign_random_roles(special_good: ["Merlin"], special_bad: [], bad_number: 2)

    roles = role_list(special_good, special_bad, bad_number).shuffle
    characters.each do |character|
      character.update(type: roles.pop)
    end
  end

  private
    def role_list(special_good, special_bad, bad_number)
      good_list = special_good + Array.new(10, "Character")
      bad_list = special_bad + Array.new(10, "BadGuy")

      good_list.first(bad_number > characters.length ? 0 : characters.length - bad_number) +
      bad_list.first(bad_number)
    end

    # def good_guy_count_hash
    #   {
    #     "5" => 3,
    #     "6" => 4,
    #     "7" => 4,
    #     "8" => 5,
    #     "9" => 6,
    #     "10" => 6
    #   }
    # end
    #
    # def bad_guy_count_hash
    #   {
    #     "5" => 2,
    #     "6" => 2,
    #     "7" => 3,
    #     "8" => 3,
    #     "9" => 3,
    #     "10" => 4
    #   }
    # end
end