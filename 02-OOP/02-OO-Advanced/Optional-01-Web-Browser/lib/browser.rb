require 'open-uri'
require 'nokogiri'

class Browser
  def fetch_content(url)
    Nokogiri::HTML(open(url)) do |config|
      config.strict.noent
    end
  end
end