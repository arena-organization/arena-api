class Api::V1::Clients::DashboardController < ApplicationController
  before_action :establishments

  def index 
    render json: @establishments, each_serializer: ::Clients::EstablishmentSerializer
  end

  private
  def establishments
    @establishments = Establishment.all
  end
end