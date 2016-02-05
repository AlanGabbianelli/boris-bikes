BORIS BIKE
==========
Makers Week One: Weekly Challenge
---------------------------------

Transport for London, the body responsible for delivery of a new bike system want a network of Docking Stations and bikes that anyone can use. They want a program that will run all the Docking Stations, simulate all the Bikes, and emulate all the infrastructure (vans, repair staff, and so on) required to make their dream a reality. They call it - guess what? - 'Boris' Bikes, and they're offering a tasty sum of money.

Instructions
------------

1. Fork this repo, and clone to your local machine `git clone <url>`
2. Ensure you open `irb` or `pry` or a REPL of your choice.
   * Governing body will be responsible for the functionality of the Docking Station i.e. setting the capacity, releasing bikes, etc.
   * Anyone can use use the Bikes provided by the Docking Station

```ruby
$ irb # from project directory
> require './lib/bike'
> require './lib/docking_station'
> bike = Bike.new
> bike.working?
> bank = DockingStation.new
> bank.dock(bike)
> bank.release_bike
```
User Stories
------------
```
As a person,
So that I can use a bike,
I'd like a docking station to release a bike.

As a person,
So that I can use a good bike,
I'd like to see if a bike is working

As a member of the public
So I can return bikes I've hired
I want to dock my bike at the docking station

As a member of the public
So I can decide whether to use the docking station
I want to see a bike that has been docked

As a member of the public,
So that I am not confused and charged unnecessarily,
I'd like docking stations not to release bikes when there are none available.

As a maintainer of the system,
So that I can control the distribution of bikes,
I'd like docking stations not to accept more bikes than their capacity.

As a system maintainer,
So that I can plan the distribution of bikes,
I want a docking station to have a default capacity of 20 bikes.

As a member of the public,
So that I reduce the chance of getting a broken bike in future,
I'd like to report a bike as broken when I return it.

As a maintainer of the system,
So that I can manage broken bikes and not disappoint users,
I'd like docking stations not to release broken bikes.

As a maintainer of the system,
So that I can manage broken bikes and not disappoint users,
I'd like docking stations to accept returning bikes (broken or not).
```

note
----
I managed to squeze some coding time on my own during the Christmas Break afforded to us at Makers Academy. Although the weekly challenges are designed to be worked on pairs, I took this opportunity the break to work on it on my to;
  a)  consolidate my understanding of what we have been learning thus far and,
  b)  get further than I originally managed with these challenges in week one.

Approach
--------
My approach to solving this challenge was to start with a DockingStation class, build it as much as I could until I needed to start understanding how one class object would change another. I did pretty well with a TDD approach until the last few challenges where I was not able to implement the Van and Garage Classes mainly due to time management as I intend to complete all four weeks challenges before by the end of the break. (I do, however, intent to complete unfinished work)

Class DockingStation
====================
Initialization
--------------
* Capacity: docking stations will have a default capacity unless specified
* Bikes: a bike will be stored in a 'bikes' array 

Method release_bike
-------------------
* allows bikes to be released
* will fail if it is empty or it happens to be holding a broken/faulty bike

Method dock
-----------
* allows bikes to be docked
* will fail if it is full
* there is no guard against taking in broken bikes

Class Bike
==========
Initialization
--------------
* Broken: this defualts to false as bike is expected to be in working condition

Method broken?
--------------
* this is designed to describe what state the bike is in (broken or not)

Method report_broken
--------------------
* this is what will be used to change the defualt state of the bike from working (broken = false) to broken (broken = true)