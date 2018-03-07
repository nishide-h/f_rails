class TweetsController < ApplicationController
  def index
    @tweets = Tweet.all
  end

  def show; end

  def new; end

  def create
    Tweet.create(title: params[:tweet][:title],
                 content: params[:tweet][:content])
    redirect_to '/tweets/index'
  end
end
