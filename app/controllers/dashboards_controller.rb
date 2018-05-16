class DashboardsController < ApplicationController

  def show
    render locals: { current_user: current_user }
  end
end
