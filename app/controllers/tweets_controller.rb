class TweetsController < ApplicationController
  PER = 5

  def index
    @tweets = Tweet.page(params[:page]).per(PER)
  end

  def show
    @tweet = Tweet.where(id: :id, user_id: :user_id)
  end

  def new; end

  def create
    @tweet = Tweet.new(tweet_params)
    @tweet.user_id = params[:user_id]

    respond_to do |format|
      if @tweet.save
        format.html { redirect_to user_tweets_path, notice: "Tweetを登録しました。" }
      else
        format.html { render :new }
      end
    end
  end

  private
    def tweet_params
      params.require(:tweet).permit(:title, :content, :user_id)
    end
end
