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
  before_create :set_occupation, :set_log

  def set_occupation
    self.occupation = common_occupations.sample
  end

  def set_log
    self.log = ""
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

  def delete_game
    self.destroy
  end

  def add_to_log(message)
    self.log ||= ""
    self.log += message + "\n"
    self.save
  end
end
