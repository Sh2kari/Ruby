# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

weekdays = Weekday.create([{ title: 'Monday',    cover: File.open(Rails.root + 'app/assets/images/1.jpg') },
                           { title: 'Tuesday',   cover: File.open(Rails.root + 'app/assets/images/2.jpg') },
                           { title: 'Wednesday', cover: File.open(Rails.root + 'app/assets/images/3.jpg') },
                           { title: 'Thursday',  cover: File.open(Rails.root + 'app/assets/images/4.jpg') },
                           { title: 'Friday',    cover: File.open(Rails.root + 'app/assets/images/5.jpg') },
                           { title: 'Saturday',  cover: File.open(Rails.root + 'app/assets/images/6.jpg') },
                           { title: 'Sunday',    cover: File.open(Rails.root + 'app/assets/images/7.jpg') }
                          ])
