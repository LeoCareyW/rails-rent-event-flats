class UsersController < ApplicationController
  def show
  @user = User.name
  end
end
