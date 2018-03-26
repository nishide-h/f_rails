require "rails_helper"

RSpec.describe Tweet, type: :model do
  let!(:user) { FactoryBot.create(:valid_user) }

  describe "validates" do
    before do
      @tweet = Tweet.new(
        title: "テストタイトル",
        content: "テストコンテンツ",
        user_id: user.id
      )
    end

    it "正常系" do
      expect(@tweet).to be_valid
    end

    it "タイトルが空白のとき、エラー" do
      @tweet.title = ""
      expect(@tweet).not_to be_valid
    end

    it "コンテンツが空白のとき、エラー" do
      @tweet.content = ""
      expect(@tweet).not_to be_valid
    end

    it "ユーザーIDが空白のとき、エラー" do
      @tweet.user_id = ""
      expect(@tweet).not_to be_valid
    end
  end
end
