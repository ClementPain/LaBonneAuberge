class StaticPagesController < ApplicationController
  def welcome
    render "/static_pages/welcome"
  end

  def contact
  end
end
