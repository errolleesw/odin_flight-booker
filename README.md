# README
This is a project from The Odin Project's Ruby on Rails cirriculum. You can find more information here: https://www.theodinproject.com/lessons/ruby-on-rails-flight-booker.

## Set up rails commands

```bash
# create project
rails new odin_flight-booker --database=postgresql

# create the Airport scaffold
rails generate scaffold Airport code:string name:string 
# create the Airline scaffold
rails generate scaffold Airline code:string name:string 
# create the Flight scaffold
rails generate scaffold Flight flight_number:string airline:references origin:references destination:references departure_time:datetime arrival_time:datetime duration:integer 
# create the Bookings scaffold
rails generate scaffold Booking flight:references num_passengers:integer
rails generate scaffold Passenger name:string email:string
rails generate scaffold PassengerBooking booking:references passenger:references
```

Airlines and airport data sourced from: https://openflights.org/data.html


## Learnings
- Creating Search forms
- Creating Search forms with dropdown lists based on data in the database.
- 