FactoryBot.define do
  factory :valid_user, class: User do
    name ""
    username ""
    location ""
    about ""
    email "nishide.h@example.com"
    password "nishide"
    password_confirmation "nishide"
  end
end
