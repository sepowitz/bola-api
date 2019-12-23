class StandingsController < ApplicationController
  def show
    guardian_football = Adapter::GuardianFootball.new
    table_source = guardian_football.show_table(params[:id])
    formatted_league_table = Guardian::LeagueTable.call(table_source)
    render :json => formatted_league_table
  end
end


