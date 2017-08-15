# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

ActiveRecord::Base.transaction do
  user_1 = User.create!(email: 'a@a.com',
                        first_name: 'K',
                        last_name: 'G',
                        image: '',
                        date_of_birth: 18.years.ago.at_midnight,
                        location: 'Dublin',
                        password: 'password')

  user_2 = User.create!(email: 'b@b.com',
                        first_name: 'D',
                        last_name: 'G',
                        image: '',
                        location: 'Dublin',
                        date_of_birth: 18.years.ago.at_midnight,
                        password: 'password')
end
