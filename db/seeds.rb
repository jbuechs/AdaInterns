# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require 'csv'

tables = {
  "Company" => './seeds_csvs/company.csv',
  "Employee" => './seeds_csvs/employee.csv',
  "Intern" => './seeds_csvs/intern.csv'}

tables.each do |k, v|
  data = CSV.read(v, :headers => true, :header_converters => :symbol).map{ |row| row.to_hash }
  data.each do |info|
    if k == "Company"
      Company.create(info)
    elsif k == "Employee"
      Employee.create(info)
    elsif k == "Intern"
      Intern.create(info)
    end
  end
end
