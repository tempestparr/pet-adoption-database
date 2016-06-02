class UsersController < ApplicationController

  def index
    @users = User.all
  end

end

# http://stackoverflow.com/questions/16931380/creating-an-index-view-for-a-devise-user