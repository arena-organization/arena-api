class Api::V1::Managers::MatchesController < ApplicationController
  before_action :authenticate_api_user!
  # before_action :set_match, only: %i[ show edit update destroy ]

  def index
    # render json: Match.all_matches_to_establishments_manager(current_api_user)
  end

  
  # def match_params
  #   params.require(:match).permit(:establishment_id, :date_time, :title)
  # end
end
