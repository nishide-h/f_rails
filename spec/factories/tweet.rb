FactoryBot.define do
  factory :valid_tweet, class: Tweet do
    title "テストタイトル"
    content "テストコンテンツ"
    user_id 1
  end
end
