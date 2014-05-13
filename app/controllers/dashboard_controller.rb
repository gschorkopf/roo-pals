class DashboardController < ApplicationController
  def show
    dates = ["/2014/06/15"]
    doc = Nokogiri::HTML(open('http://lineup.bonnaroo.com/geoff'))

    @artists = []
    doc.css('.ds-attending .ds-event-title a').each do |link|
      @artists << link.content
    end
  end
end
