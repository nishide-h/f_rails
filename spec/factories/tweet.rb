FactoryBot.define do
  factory :valid_tweet, class: Tweet do
    id 1
    title "テストタイトル"
    content "テストコンテンツ"
    user_id 1
  end
end
