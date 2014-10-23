require 'sqlite3'

def detailed_tracks(db)
  # TODO: return the list of tracks with their album and artist
  db.execute <<-SQL

  SELECT t.name, alb.title, art.name
  FROM tracks t
  JOIN albums alb ON alb.id = t.album_id
  JOIN artists art ON art.id = alb.artist_id;

  SQL
end

def stats_on(db, genre_name)
  # TODO: For the given category of music, return the number of tracks and the average song length (as a stats hash)
  so = db.execute <<-SQL

  SELECT g.name, COUNT(*), ROUND(AVG(t.milliseconds / 60000.0),2)
  FROM tracks t
  JOIN genres g ON g.id = t.genre_id
  WHERE g.name = '#{genre_name}';

  SQL

  {
    category: so.flatten[0],
    number_of_songs: so.flatten[1],
    avg_length: so.flatten[2]
  }
end

def top_five_artists(db, genre_name)
  # TODO: return list of top 5 rock artists
  db.execute <<-SQL

  SELECT art.name, COUNT(art.name) as c
  FROM artists art
  JOIN albums alb ON alb.artist_id = art.id
  JOIN tracks t ON t.album_id = alb.id
  JOIN genres g ON g.id = t.genre_id
  WHERE g.name = '#{genre_name}'
  GROUP BY art.name
  ORDER BY c DESC
  LIMIT 5;

  SQL
end