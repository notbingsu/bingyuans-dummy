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
FactoryBot.define do
  factory :game do
    in_game { false }
    occupation { "MyString" }
    log { "MyText" }
  end

  factory :default_game, class: Game do
    in_game { true }
    occupation { "default" }
    log { "text" }
  end
end
