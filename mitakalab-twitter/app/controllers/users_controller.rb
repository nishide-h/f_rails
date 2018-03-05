class UsersController < ApplicationController
  def index
  end

  def show
    @user = Hash.new
    @user[:name] = 'Takahiro Aoki'
    @user[:username] = 'Hanryu'
    @user[:location] = 'Tokyo, Japan'
    @user[:about] = 'Nice to meet you!!'
  end
end
