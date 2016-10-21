# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
events = Event.create({:name => 'vodQA', :edition => 1, :date => DateTime.now})
Participant.create({:name => 'kushboo', :email => 'kushbooj@thoughtworks.com', :contact_number => '9840171038', :from => 'ThoughtWorks', :event => events.first})
