# encoding: utf-8

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

if Faculty.count == 0
  Faculty.create(name: "Mühendislik Fakültesi")
  Faculty.create(name: "Eğitim Fakültesi")
end

if Department.count == 0
  Department.create(name: "Bilgisayar Mühendisliği", faculty_id: 1)
  Department.create(name: "Orta Öğretim Matematik Öğretmenliği", faculty_id: 2)
end

if Student.count == 0
  Student.create(firstname: "Emre Can", lastname: "Yılmaz", department_id: 1)
  Student.create(firstname: "Bilge", lastname: "Çorumlu", department_id: 2)
end
