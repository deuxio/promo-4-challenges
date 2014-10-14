# Encoding: utf-8
require 'csv'

def most_successfull(number, max_year, file_name)
  movies = []
  movies_until = []

  CSV.foreach(file_name) do |row|
    movies << { name: row[0], year: row[1].to_i, earnings: row[2].to_i }
  end

  movies.each do |movie|
    movies_until << { name: movie[:name], year: movie[:year], earnings: movie[:earnings] } if movie[:year] < max_year
  end
  movies_until.sort { |a, b| a[:earnings] <=> b[:earnings] }
  p movies_until.first number
end