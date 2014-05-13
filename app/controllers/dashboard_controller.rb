class DashboardController < ApplicationController
  def show
    dates = ["/2014/06/15"]
    doc = Nokogiri::HTML(open('http://lineup.bonnaroo.com/geoff'))

    @artists = []
    doc.css('.ds-attending .ds-event-title a').each do |link|
      artist = link.content
      if artist.length > 75
        @artists << artist[0..74] + "..."
      else
        @artists << artist
      end
    end
  end
end
