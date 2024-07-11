require_relative "/home/bingsu/bootcamp/app/common_occupations.rb"
class Game < ApplicationRecord
  before_create :set_occupation

  def set_occupation
    self.occupation = "doctor"
  end

  def validate_guess(guess)
    guess = guess.downcase
    if guess.include? self.occupation
      self.in_game = false
      return true
    else
      return false
    end
  end
end
