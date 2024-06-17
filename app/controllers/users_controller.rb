class UsersController < ApplicationController
  def index
    @users = User.top_5_users
  end
end
