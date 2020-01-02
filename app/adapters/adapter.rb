module Adapter
  class GuardianFootball
    OPTIONS = Selenium::WebDriver::Chrome::Options.new(args: ['headless'])
    BASE_URL = "https://www.theguardian.com/"

    def initialize()
      @driver = Selenium::WebDriver.for(:chrome, options: OPTIONS)
    end
    
    def show_table(league_slug)
      @driver.navigate.to("#{BASE_URL}/football/#{league_slug}/table")
      @driver.page_source
    end

    def index_competitions
      @driver.navigate.to("#{BASE_URL}/football/tables")
      @driver.page_source
    end

    def index_teams
      @driver.navigate.to("#{BASE_URL}/football/teams")
      @driver.page_source
    end
  end
end


# standings
# fixtures
# results
