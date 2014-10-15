require 'open-uri'
require 'json'

def generate_grid(grid_size)
  alphabet = ('a'..'z').to_a
  grid = []
  grid_size.times { grid << alphabet.sample.upcase }
  grid
end

def run_game(attempt, grid, start_time, end_time)
  # TODO: runs the game and return detailed hash of result
  result = {}
  result[:time] = end_time - start_time
  if attempt.downcase.split(//).all? { |letter| grid.map(&:downcase).include? letter }
    open("http://api.wordreference.com/0.8/80143/json/enfr/#{attempt.downcase}") do |stream|
      translations = JSON.parse(stream.read)
      if translations['Error']
        result[:message] = "not an english word"
        result[:score] = 0
      else
        result[:translation] = translations['term0']['PrincipalTranslations']['0']['FirstTranslation']['term']
        result[:score] = attempt.length**2 - result[:time]**2.to_i
        result[:message] = "well done"
      end
    end
  else
    result[:score] = 0
    result[:message] = "not in the grid"
  end
  result
end

Eric STUDIO LAREDO <anna@studio-laredo.fr>