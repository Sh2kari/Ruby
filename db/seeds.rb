# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

organizations = Organization.create([{ name: 'JetRuby' },
                                     { name: 'Google' },
                                     { name: 'Yandex' }
                                    ])

weekdays = Weekday.create([{ title: 'Monday',    cover: File.open(Rails.root + 'app/assets/images/1.jpg'), date: (Date.today.at_beginning_of_week).strftime("%d %B %Y") },
                           { title: 'Tuesday',   cover: File.open(Rails.root + 'app/assets/images/2.jpg'), date: (Date.today.at_beginning_of_week+1.day).strftime("%d %B %Y") },
                           { title: 'Wednesday', cover: File.open(Rails.root + 'app/assets/images/3.jpg'), date: (Date.today.at_beginning_of_week+2.day).strftime("%d %B %Y")  },
                           { title: 'Thursday',  cover: File.open(Rails.root + 'app/assets/images/4.jpg'), date: (Date.today.at_beginning_of_week+3.day).strftime("%d %B %Y")  },
                           { title: 'Friday',    cover: File.open(Rails.root + 'app/assets/images/5.jpg'), date: (Date.today.at_beginning_of_week+4.day).strftime("%d %B %Y")  },
                           { title: 'Saturday',  cover: File.open(Rails.root + 'app/assets/images/6.jpg'), date: (Date.today.at_beginning_of_week+5.day).strftime("%d %B %Y")  },
                           { title: 'Sunday',    cover: File.open(Rails.root + 'app/assets/images/7.jpg'), date: Date.today.at_end_of_week.strftime("%d %B %Y") }
                          ])

categories = Category.create([{ name: 'First course' },
                              { name: 'Second course' },
                              { name: 'Drinks' }
                            ])

products = Product.create([{ title: 'Vegan Chickpea Soup', price: '10', weekday_id: 1, category_id: 1 },
                           { title: 'Veal Shank Tortelli', price: '15', weekday_id: 1, category_id: 1 },
                           { title: 'Courgette Noodles with Tomatoes', price: '20', weekday_id: 1, category_id: 1 },
                           { title: 'Raspberry Jelly with Chia Seeds', price: '30', weekday_id: 1, category_id: 2 },
                           { title: 'Glutten Free Chinese Cake', price: '40', weekday_id: 1, category_id: 2 },
                           { title: 'Honey and Walnut Biscuits', price: '50', weekday_id: 1, category_id: 2 },
                           { title: 'Mint Julep', price: '10', weekday_id: 1, category_id: 3 },
                           { title: 'Cantaloupe Smoothie', price: '15', weekday_id: 1, category_id: 3 },
                           { title: 'Peach and Papaya Smoothie', price: '10', weekday_id: 1, category_id: 3 }
                          ])

products = Product.create([{ title: 'Soup', price: '10', weekday_id: 2, category_id: 1 },
                           { title: 'Tortelli', price: '15', weekday_id: 2, category_id: 1 },
                           { title: 'Tomatoes', price: '20', weekday_id: 2, category_id: 1 },
                           { title: 'Seeds', price: '30', weekday_id: 2, category_id: 2 },
                           { title: 'Cake', price: '40', weekday_id: 2, category_id: 2 },
                           { title: 'Biscuits', price: '50', weekday_id: 2, category_id: 2 },
                           { title: 'Julep', price: '10', weekday_id: 2, category_id: 3 },
                           { title: 'Smoothie', price: '15', weekday_id: 2, category_id: 3 },
                           { title: 'Smoothie', price: '10', weekday_id: 2, category_id: 3 }
                          ])

products = Product.create([{ title: 'Soup', price: '10', weekday_id: 3, category_id: 1 },
                           { title: 'Tortelli', price: '15', weekday_id: 3, category_id: 1 },
                           { title: 'Tomatoes', price: '20', weekday_id: 3, category_id: 1 },
                           { title: 'Seeds', price: '30', weekday_id: 3, category_id: 2 },
                           { title: 'Cake', price: '40', weekday_id: 3, category_id: 2 },
                           { title: 'Biscuits', price: '50', weekday_id: 3, category_id: 2 },
                           { title: 'Julep', price: '10', weekday_id: 3, category_id: 3 },
                           { title: 'Smoothie', price: '15', weekday_id: 3, category_id: 3 },
                           { title: 'Smoothie', price: '10', weekday_id: 3, category_id: 3 }
                          ])

products = Product.create([{ title: 'Soup', price: '10', weekday_id: 4, category_id: 1 },
                           { title: 'Tortelli', price: '15', weekday_id: 4, category_id: 1 },
                           { title: 'Tomatoes', price: '20', weekday_id: 4, category_id: 1 },
                           { title: 'Seeds', price: '30', weekday_id: 4, category_id: 2 },
                           { title: 'Cake', price: '40', weekday_id: 4, category_id: 2 },
                           { title: 'Biscuits', price: '50', weekday_id: 4, category_id: 2 },
                           { title: 'Julep', price: '10', weekday_id: 4, category_id: 3 },
                           { title: 'Smoothie', price: '15', weekday_id: 4, category_id: 3 },
                           { title: 'Smoothie', price: '10', weekday_id: 4, category_id: 3 }
                          ])

products = Product.create([{ title: 'Soup', price: '10', weekday_id: 5, category_id: 1 },
                           { title: 'Tortelli', price: '15', weekday_id: 5, category_id: 1 },
                           { title: 'Tomatoes', price: '20', weekday_id: 5, category_id: 1 },
                           { title: 'Seeds', price: '30', weekday_id: 5, category_id: 2 },
                           { title: 'Cake', price: '40', weekday_id: 5, category_id: 2 },
                           { title: 'Biscuits', price: '50', weekday_id: 5, category_id: 2 },
                           { title: 'Julep', price: '10', weekday_id: 5, category_id: 3 },
                           { title: 'Smoothie', price: '15', weekday_id: 5, category_id: 3 },
                           { title: 'Smoothie', price: '10', weekday_id: 5, category_id: 3 }
                          ])

products = Product.create([{ title: 'Soup', price: '10', weekday_id: 6, category_id: 1 },
                           { title: 'Tortelli', price: '15', weekday_id: 6, category_id: 1 },
                           { title: 'Tomatoes', price: '20', weekday_id: 6, category_id: 1 },
                           { title: 'Seeds', price: '30', weekday_id: 6, category_id: 2 },
                           { title: 'Cake', price: '40', weekday_id: 6, category_id: 2 },
                           { title: 'Biscuits', price: '50', weekday_id: 6, category_id: 2 },
                           { title: 'Julep', price: '10', weekday_id: 6, category_id: 3 },
                           { title: 'Smoothie', price: '15', weekday_id: 6, category_id: 3 },
                           { title: 'Smoothie', price: '10', weekday_id: 6, category_id: 3 }
                          ])

products = Product.create([{ title: 'Soup', price: '10', weekday_id: 7, category_id: 1 },
                           { title: 'Tortelli', price: '15', weekday_id: 7, category_id: 1 },
                           { title: 'Tomatoes', price: '20', weekday_id: 7, category_id: 1 },
                           { title: 'Seeds', price: '30', weekday_id: 7, category_id: 2 },
                           { title: 'Cake', price: '40', weekday_id: 7, category_id: 2 },
                           { title: 'Biscuits', price: '50', weekday_id: 7, category_id: 2 },
                           { title: 'Julep', price: '10', weekday_id: 7, category_id: 3 },
                           { title: 'Smoothie', price: '15', weekday_id: 7, category_id: 3 },
                           { title: 'Smoothie', price: '10', weekday_id: 7, category_id: 3 }
                          ])
