module Guardian
  class LeagueTable < ApplicationService
    attr_reader :page_source
  
    def initialize(page_source)
      @doc = Nokogiri::HTML(page_source)
    end
  
    def call
      table_rows = @doc.css(".table--league-table tr").each_with_index.map do |tr, tr_i|
        { 
          position: tr_i, 
          cells: tr.children.select { |td| td.text != "\n"}
            .map.with_index do |td, i| 
              { 
                position: i, 
                value: td.text.strip 
              }
            end
        }
      end
    end
  end
end