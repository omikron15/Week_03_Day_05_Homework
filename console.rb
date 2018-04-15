require_relative("./Modules/customer.rb")
require_relative("./Modules/film.rb")
require_relative("./Modules/ticket.rb")
require_relative("./Modules/screening.rb")
require("pry-byebug")

Ticket.delete_all()
Film.delete_all()
Customer.delete_all()
Screening.delete_all()

  customer1 = Customer.new({
    "name" => "Customer1",
    "funds" => 500
  })

  customer2 = Customer.new({
    "name" => "Customer2",
    "funds" => 1000
  })

  customer3 = Customer.new({
    "name" => "Customer3",
    "funds" => 2000
  })

  customer4 = Customer.new({
    "name" => "Customer4",
    "funds" => 4000
  })

  customer5 = Customer.new({
    "name" => "Customer5",
    "funds" => 3000
  })

  customer6 = Customer.new({
    "name" => "Customer6",
    "funds" => 2000
  })

customer1.save()
customer2.save()
customer3.save()
customer4.save()
customer5.save()
customer6.save()

  film1 = Film.new({
    "title" => "Film1",
    "price" => "250"
  })

  film2 = Film.new({
    "title" => "Film2",
    "price" => "500"
  })

  film3 = Film.new({
    "title" => "Film3",
    "price" => "750"
  })

  film4 = Film.new({
    "title" => "Film4",
    "price" => "1000"
  })

film1.save()
film2.save()
film3.save()
film4.save()

  screening1 = Screening.new({
    "film_id" => film1.id,
    "show_time" => "09:00"
  })

  screening2 = Screening.new({
    "film_id" => film2.id,
    "show_time" => "10:00"
  })

  screening3 = Screening.new({
    "film_id" => film3.id,
    "show_time" => "11:00"
  })

  screening4 = Screening.new({
    "film_id" => film4.id,
    "show_time" => "12:00"
  })

  screening5 = Screening.new({
    "film_id" => film1.id,
    "show_time" => "13:00"
  })

  screening6 = Screening.new({
    "film_id" => film2.id,
    "show_time" => "14:00"
  })

  screening7 = Screening.new({
    "film_id" => film3.id,
    "show_time" => "15:00"
  })

  screening8 = Screening.new({
    "film_id" => film4.id,
    "show_time" => "16:00"
  })

screening1.save
screening2.save
screening3.save
screening4.save
screening5.save
screening6.save
screening7.save
screening8.save


  ticket1 = Ticket.new({
    "customer_id" => customer1.id ,
    "screening_id" => screening1.id
  })

  ticket2 = Ticket.new({
    "customer_id" => customer2.id ,
    "screening_id" => screening1.id
  })

  ticket3 = Ticket.new({
    "customer_id" => customer3.id ,
    "screening_id" => screening2.id
  })

  ticket4 = Ticket.new({
    "customer_id" => customer4.id ,
    "screening_id" => screening3.id
  })

  ticket5 = Ticket.new({
    "customer_id" => customer1.id ,
    "screening_id" => screening5.id
  })

  ticket6 = Ticket.new({
    "customer_id" => customer4.id ,
    "screening_id" => screening5.id
  })

  ticket7 = Ticket.new({
    "customer_id" => customer3.id ,
    "screening_id" => screening6.id
  })

  ticket8 = Ticket.new({
    "customer_id" => customer1.id ,
    "screening_id" => screening8.id
  })

  ticket9 = Ticket.new({
    "customer_id" => customer2.id ,
    "screening_id" => screening8.id
  })

  ticket10 = Ticket.new({
    "customer_id" => customer3.id ,
    "screening_id" => screening8.id
  })

  ticket11 = Ticket.new({
    "customer_id" => customer4.id ,
    "screening_id" => screening8.id
  })

  ticket1.save()
  ticket2.save()
  ticket3.save()
  ticket4.save()
  ticket5.save()
  ticket6.save()
  ticket7.save()
  ticket8.save()
  ticket9.save()
  ticket10.save()
  ticket11.save()

binding.pry
nil
