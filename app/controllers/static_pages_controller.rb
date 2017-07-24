class StaticPagesController < ApplicationController
  def home
    if current_user
      @micropost = current_user.microposts.build
      @feed_items = current_user.feed.page params[:page]
    end
  end

  def help
  end

  def about
    
  end
end
