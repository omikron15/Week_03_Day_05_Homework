require_relative("../db/sql_runner")
require_relative("./customer.rb")
require("pry-byebug")

class Film

  attr_reader :id
  attr_accessor :title, :price

  def initialize( options )
    @id = options['id'].to_i if options['id']
    @title = options['title']
    @price = options['price'].to_i
  end

  def save()
    sql = "INSERT INTO films (title, price) VALUES ($1, $2) RETURNING id;"
    values = [@title, @price]
    result = SqlRunner.run(sql,values)
    @id = result[0]["id"].to_i
  end

  def self.all()
    sql = "SELECT * FROM films;"
    films = SqlRunner.run(sql)
    return films.map{|film| self.new(film)}
  end

  def self.delete_all()
    sql = "DELETE FROM films;"
    SqlRunner.run(sql)
  end

  def delete()
    sql = "DELETE FROM films WHERE id = $1;"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def update()
    sql = "UPDATE films SET (title, price) = ($1, $2) WHERE id = $3;"
    values = [@title, @price, @id]
    SqlRunner.run(sql, values)
  end

# Customers method is no longer required after the addition of
# the screenings table and class?

  # def customers()
  #   sql = "SELECT customers.* FROM customers
  #   INNER JOIN tickets ON customers.id = tickets.customer_id
  #   WHERE tickets.film_id = $1"
  #   values = [@id]
  #   customers = SqlRunner.run(sql, values)
  #   return Customer.map_customers(customers)
  # end
  #
  # def customers_count()
  #     return customers().count
  # end

  def self.map_films(film_data)
    return film_data.map {|film_hash| Film.new(film_hash)}
 end

 def screenings
   sql = "SELECT screenings.* FROM screenings
   WHERE film_id = $1"
   values = [@id]
   screenings = SqlRunner.run(sql, values)
   return Screening.map_screenings(screenings)
 end

 def self.find_film_by_id(id)
   sql = "SELECT * FROM films WHERE id = $1"
   values = [id]
   result = SqlRunner.run(sql, values)

    if result.count == 0
      return nil
    else
      return Film.new(result[0])
    end

  end



  def most_popular_screening
      array = screenings()
      number = 0
      result = []
      for each_screening in array
        if each_screening.customers_count > number
          number = each_screening.customers_count
          result.clear
          result.push(each_screening)
        elsif each_screening.customers_count == number
          result.push(each_screening)
        end
      end
      return result
  end



end #End of class
