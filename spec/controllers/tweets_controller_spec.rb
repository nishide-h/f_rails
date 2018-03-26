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
end
