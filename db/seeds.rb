# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Team.destroy_all
Player.destroy_all

team_1 = Team.create!( name: 'Nuggets', city: 'Denver', rank: 1, confrence: "west", has_won_championship: false )
team_2 = Team.create!( name: 'Celtics', city: 'Boston', rank: 2, confrence: "east", has_won_championship: true )
team_3 = Team.create!( name: 'Grizzlies', city: 'Memphis', rank: 3, confrence: "west", has_won_championship: false )
player_1 = team_1.players.create!( name: 'Nikola Jokić', age: 27, height_in_cm: 210, position: "center", is_a_rookie: false)
player_2 = team_1.players.create!( name: 'Jamal Murray', age: 25, height_in_cm: 193, position: "point guard", is_a_rookie: false)