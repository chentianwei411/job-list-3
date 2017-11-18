class WelcomeController < ApplicationController
  def index
    flash[:alert] = "警告警告警告"
  end
end
