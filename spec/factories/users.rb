FactoryBot.define do
  factory :user do
    nickname              {"nakaji"}
    email                 {Faker::Internet.free_email}
    password              {"a12345"}
    encrypted_password    {"a12345"}
    last_name             {"中島"}
    last_name_kana        {"ナカジマ"}
    first_name            {"史一"}
    first_name_kana       {"フミカズ"}
    birthday             {"1983-08-16"}
  end
end