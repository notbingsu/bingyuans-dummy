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
require 'rails_helper'

RSpec.describe Game, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
  it "no games are created at the index page" do
    expect(Game.all.count).to eq(0)
  end
  it "default game has in_game set to true and default occupation and no log" do
    game = build(:default_game)
    expect(game.in_game).to eq(true)
    expect(game.occupation).to eq("default")
  end

  it "if occupation is guessed correctly, in_game is set to false" do
    game = build(:default_game)
    guess = game.occupation
    expect(game.validate_guess(guess)).to eq(true)
    expect(game.in_game).to eq(false)
  end

  it "if occupation is guessed correctly, games are reset" do
    game = build(:default_game)
    guess = game.occupation
    game.validate_guess(guess)
    expect(Game.all.count).to eq(0)
  end
end
