class DashboardController < ApplicationController
  def show
    dates = ["/2014/06/15"]
    doc = Nokogiri::HTML(open('http://lineup.bonnaroo.com/geoff'))

    @artists = []
    doc.css('.ds-attending').each do |div|
      artist = []
      div.css('.ds-event-title a').each do |link|
        if link.content.length > 75
          artist << link.content[0..74] + "..."
        else
          artist << link.content
        end
      end

      div.css('.ds-time-range').each do |span|
        artist << span.content
      end

      @artists << artist
    end
  end
end
