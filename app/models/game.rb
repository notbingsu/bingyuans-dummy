# == Schema Information
#
# Table name: games
#
#  id         :bigint           not null, primary key
#  in_game    :boolean
#  occupation :string
#  log        :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
require_relative '../common_occupations'
class Game < ApplicationRecord
  before_create :set_occupation
  def set_occupation
    self.occupation = common_occupations.sample
  end

  def validate_guess(guess)
    guess = guess.downcase
    Rails.logger.info(self.occupation)
    Rails.logger.info("Guess: #{guess}")
    if guess.include? self.occupation
      self.in_game = false
      return true
    else
      return false
    end
  end
end
