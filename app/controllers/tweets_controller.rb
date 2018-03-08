# frozen_string_literal: true

class TweetsController < ApplicationController
  PER = 5

  def index
    @tweets = Tweet.page(params[:page]).per(PER)
  end

  def show; end

  def new; end

  def create
    Tweet.create(title: params[:tweet][:title],
                 content: params[:tweet][:content])
    redirect_to "/tweets/index"
  end
end
