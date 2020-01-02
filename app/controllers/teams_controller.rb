class TeamsController < ApplicationController
  def index
    guardian_football = Adapter::GuardianFootball.new
    teams_source = guardian_football.index_teams
    formatted_teams = Guardian::AllTeams.call(teams_source)
    render :json => formatted_teams
  end
end
