require "rails_helper"

RSpec.describe Tweet, type: :model do
  describe "登録" do
    before do
      @tweet = Tweet.new(
        title: "テストタイトル",
        content: "テストコンテンツ"
      )
    end

    it "通常登録" do
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
  end
end
