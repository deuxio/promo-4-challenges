require 'open-uri'
require 'nokogiri'

class Browser
  def fetch_content(url)
    doc = Nokogiri::HTML(open(url))
    # do |config|
    #   config.strict.noent
    # end
    # print doc.xpath("//*/td[@class='overview-top']").xpath('text()').to_s
    doc = doc.xpath("//text()")
  end
end