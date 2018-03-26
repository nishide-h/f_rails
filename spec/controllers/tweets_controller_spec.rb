require "rails_helper"

RSpec.describe TweetsController, type: :controller do
  let!(:user) { FactoryBot.create(:valid_user) }
  let!(:valid_tweet) { FactoryBot.create(:valid_tweet) }

  describe "GET #show" do
    before do
      login_user user
    end

    it "リクエストが成功すること" do
      get :show, params: { user_id: user.id, id: valid_tweet.id }
      expect(response.status).to eq(200)
    end

    it "showテンプレートを使用すること" do
      get :show, params: { user_id: user.id, id: valid_tweet.id }
      expect(response).to render_template :show
    end
  end

  describe "POST #create" do
    before do
      login_user user
    end

    it "データが登録されること" do
      expect do
        post :create, params: {
          user_id: user.id,
          tweet: {
            title: valid_tweet.title,
            content: valid_tweet.content
          }
        }
      end.to change(Tweet, :count).by(1)
    end

    it "データ登録後、index画面へリダイレクトされること" do
      post :create, params: {
        user_id: user.id,
        tweet: {
          title: valid_tweet.title,
          content: valid_tweet.content
        }
      }
      expect(response).to redirect_to user_tweets_path
    end
  end
end
