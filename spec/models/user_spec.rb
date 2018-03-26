require "rails_helper"

RSpec.describe User, type: :model do
  describe "validates" do
    before do
      @user = User.new(
        email: "test@example.com",
        password: "testpass",
        uid: "",
        avatar_file_name: nil,
        avatar_content_type: nil,
        avatar_file_size: nil
      )
    end

    it "正常系" do
      expect(@user).to be_valid
    end
  end
end
