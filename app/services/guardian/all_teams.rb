module Guardian
  class AllTeams < ApplicationService
    attr_reader :page_source
  
    def initialize(page_source)
      @doc = Nokogiri::HTML(page_source)
    end
  
    def call
      #TODO: cleanup these checks 
      teams = @doc.css('.fc-container').select{|c| c.at_css('.fc-container__header__title') && c.at_css('.fc-container__header__title').children && c.at_css('.fc-container__header__title').children[1].attributes && c.at_css('.fc-container__header__title').children && c.at_css('.fc-container__header__title').children[1].attributes["href"] }.each_with_index.map do |c, i|
        header_node = c.at_css('.fc-container__header__title');

        # Competition info
        competition_node = header_node.children[1]
        competition_slug = competition_node.attributes['href'].value.split('/')[4]
        competition_name = competition_node.children[1].text.strip

        team_nodes = c.css('.fc-item.fc-item--list-compact')

        {
          competition_name: competition_name,
          competition_slug: competition_slug,
          teams: team_nodes.each_with_index.map do |t, i|
            {
              team_slug: t.children[1].attributes['href'].value.split('/')[4],
              team_name: t.children[1].children.text.strip
            }
          end
        }
      end
    end
  end
end