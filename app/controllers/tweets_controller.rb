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
    Tweet.create(title: params[:tweet][:title],
                 content: params[:tweet][:content],
                 user_id: params[:tweet][:user_id])
    redirect_to "/tweets/index"
  end

  private
    def tweet_params
      params.require(:tweet).permit(:id, :title, :content, :user_id)
    end
end
