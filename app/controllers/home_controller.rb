class HomeController < ApplicationController
  def homepage
    @most_recent_ten = Recipe.all.order("created_at DESC").limit(10)
  end
end
