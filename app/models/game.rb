require_relative "/home/bingsu/bootcamp/app/common_occupations.rb"
class Game < ApplicationRecord
  before_create :set_occupation
  OCCUPATIONS = %w(accountant actor architect artist attorney author baker banker barber bartender biologist butcher carpenter cashier chef chemist coach construction\ worker consultant dentist designer doctor driver electrician engineer farmer firefighter flight\ attendant graphic\ designer hairdresser journalist judge librarian mechanic nurse pharmacist photographer pilot plumber police\ officer professor programmer receptionist salesperson scientist secretary teacher technician translator veterinarian waiter)
  def set_occupation
    self.occupation = OCCUPATIONS.sample
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
