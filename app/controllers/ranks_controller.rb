class RanksController < ApplicationController
  def index
    @post_image_nice_ranks = PostImage.left_joins(:nices).group(:id).order("count(nices.post_image_id) desc")
    @users = User.all
  end
end
