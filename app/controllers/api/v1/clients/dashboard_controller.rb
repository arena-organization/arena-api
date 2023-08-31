class Api::V1::Clients::DashboardController < ApplicationController
  before_action :establishments

  def index 
    # byebug
    render json: @establishments
  end

  private
  def establishments
    @establishments = Establishment.all
  end
end