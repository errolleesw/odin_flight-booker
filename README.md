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
rails generate scaffold Flight flight_number:string airline:references origin:references destination:references depature_time:datetime arrival_time:datetime duration:integer 
```