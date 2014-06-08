# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


# Initial data for administrator
Unit.delete_all
Position.delete_all
Role.delete_all
User.delete_all
Plan.delete_all
Status.delete_all
Country.delete_all
Workplace.delete_all

units = [["Administrator", "Administrator"], ["Team1", "Team leader 1"], ["Team2", "Team leader 2"]]
3.times do |i|
	unit = Unit.create(name: units[i][0], leader: units[i][1])
end

positions = ["Back Office", "Dev Room", "Front Office"]
3.times do |i|
	Position.create(name: positions[i])
end

roles = ["Administrator", "Manager", "User"]
3.times do |i|
	Role.create(name: roles[i])
end

plans = [["Plan1", 5000.0], ["Plan2", 2000.0]]
2.times do |i|
	Plan.create(name: plans[i][0], amount: plans[i][1])
end

statuses = ["Normal", "Suspended", "Closed"]
3.times do |i|
	Status.create(name: statuses[i])
end

countries = ["China", "Ukraine", "German", "Poland", "New Zealand", "France", "Egypt", "Russia", "Bularia", "Netherland"]
countries.size.times do |i|
	Country.create(name: countries[i])
end

workPlaces = ["Direct via Bank", "Online working place", "Direct via Paypal"]
workPlaces.size.times do |i|
	Workplace.create(name: workPlaces[i])
end

user = User.new(username: 'administrator', name: 'Admin User', birthday: rand(30.years).ago, password: 'admin')
user.unit = Unit.first
user.position = Position.first
user.role = Role.first
user.save