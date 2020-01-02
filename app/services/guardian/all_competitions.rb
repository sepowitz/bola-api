module Guardian
  class AllCompetitions < ApplicationService
    attr_reader :page_source
  
    def initialize(page_source)
      @doc = Nokogiri::HTML(page_source)
    end
  
    def call
      competition_names = @doc.css(".full-table-link").each_with_index.map do |l, i|
        { 
          value: l.children[1].text,
          slug: l.attributes.values[0].value.split("/")[2]
        }
      end
    end
  end
end