class Api::V1::Managers::DashboardController < ApplicationController
  before_action :authenticate_api_user!

  def index 
    render json: { a: "a"}
  end
end


