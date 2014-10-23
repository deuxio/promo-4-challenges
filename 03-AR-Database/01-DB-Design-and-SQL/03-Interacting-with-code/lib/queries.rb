require 'sqlite3'

def number_of_rows(db, table_name)
  # TODO: count number of rows in table table_name
  nb = db.execute <<-SQL

  SELECT COUNT(*) as count
  FROM #{table_name};

  SQL

  nb[0]['count']
end

def sorted_artists(db)
  # TODO: return array of artists' names sorted alphabetically
  sa = db.execute <<-SQL

  SELECT name
  FROM artists a
  ORDER BY a.name ASC

  SQL

  sa.map { |i| i['name']}
end

def love_tracks(db)
  # TODO: return array of love songs
  lt = db.execute <<-SQL

  SELECT name
  FROM tracks t
  WHERE t.name LIKE "%love%";

  SQL

  lt.map { |i| i['name']}
end

def long_tracks(db, min_length)
  # TODO: return tracks verifying: duration > min_length (minutes)
  lt = db.execute <<-SQL

  SELECT name
  FROM tracks t
  WHERE (t.milliseconds / 1000 ) > #{min_length} * 60;

  SQL

  lt.map { |i| i['name']}
end