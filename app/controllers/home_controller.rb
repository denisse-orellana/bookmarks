class HomeController < ApplicationController
  def index
    @bookmark_by_types = Bookmark.joins(:type).group(:name).count
  end
end
