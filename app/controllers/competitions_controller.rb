class CompetitionsController < ApplicationController
  def index
    guardian_football = Adapter::GuardianFootball.new
    competitions_source = guardian_football.index_competitions
    formatted_competitions = Guardian::AllCompetitions.call(competitions_source)
    render :json => formatted_competitions
  end
end
