class UsersController < ApplicationController
  def index
  end

  def show
    @user = Hash.new
    if params[:username] == 'Hirro'
      @user[:name] = 'Hiro Nishide'
      @user[:username] = 'Hirro'
      @user[:location] = 'Kyoto, Japan'
      @user[:about] = 'Hello, I am Hiro.'
    elsif params[:username] == 'Hanryu'
      @user[:name] = 'Takahiro Aoki'
      @user[:username] = 'Hanryu'
      @user[:location] = 'Tokyo, Japan'
      @user[:about] = 'Nice to meet you!!'
    end
  end
end
