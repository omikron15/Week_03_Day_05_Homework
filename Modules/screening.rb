require_relative("../db/sql_runner")

class Screening

  attr_reader :id
  attr_accessor :film_id, :show_time

  def initialize( options )
    @id = options['id'].to_i if options['id']
    @film_id = options['film_id'].to_i
    @show_time = options['show_time']
  end

  def save()
    sql = "INSERT INTO screenings (show_time, film_id) VALUES ($1, $2) RETURNING id;"
    values = [@show_time, @film_id]
    result = SqlRunner.run(sql,values)
    @id = result[0]["id"].to_i
  end

  def self.all()
    sql = "SELECT * FROM screenings;"
    screenings = SqlRunner.run(sql)
    return screenings.map{|screening| self.new(screening)}
  end

  def self.delete_all()
    sql = "DELETE FROM screenings;"
    SqlRunner.run(sql)
  end

  def delete()
    sql = "DELETE FROM screenings WHERE id = $1;"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def update()
    sql = "UPDATE screenings SET (show_time, film_id) = ($1, $2) WHERE id = $3;"
    values = [@show_time, @film_id, @id]
    SqlRunner.run(sql, values)
  end

end #End of class
