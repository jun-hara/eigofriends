class MainController < ApplicationController
  def index
    if Current.user
      # redirect_to dashboard_path(Current.user.id)
      redirect_to lessons_path
    end
  end
end