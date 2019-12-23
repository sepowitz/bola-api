module Adapter
  class GuardianFootball
    OPTIONS = Selenium::WebDriver::Chrome::Options.new(args: ['headless'])
    BASE_URL = "https://www.theguardian.com/football"

    def initialize()
      @driver = Selenium::WebDriver.for(:chrome, options: OPTIONS)
    end

    def show_table(league_slug)
      @driver.navigate.to("#{BASE_URL}/#{league_slug}/table")
      @driver.page_source
    end
  end
end


# standings
# fixtures
# results
