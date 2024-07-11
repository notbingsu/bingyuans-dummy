FactoryBot.define do
  factory :game do
    in_game { false }
    occupation { "MyString" }
    log { "MyText" }
  end
end
