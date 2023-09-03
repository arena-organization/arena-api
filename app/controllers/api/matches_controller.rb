class Api::V1::MatchesController < ApplicationController
  before_action :authenticate_api_user!
  # before_action :set_match, only: %i[ show edit update destroy ]
  
  def create

  end
  private
  def court 
    @court = Court.find(params[:court_id])
  end

  def establishment 
    @establishment = Establishment.find(params[:establishment_id])
  end
  
  def match_params
    params.require(:match).permit(:establishment_id, :date_time)
  end
end
