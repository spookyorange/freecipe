# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

User.create([
              { email: 'dasfa@fadsfas', encrypted_password: '12345678' },
              { email: 'haha@fadsfas', encrypted_password: '12345678' }

            ])

Profile.create([
                 { user_id: User.first.id, username: 'cool dude' },
                 { user_id: User.second.id, username: 'not cool dude' }

               ])

Recipe.create([
                { profile_id: Profile.first.id,
                  title: 'Pasta with Cream',
                  about: 'It is a pasta that has been made with cream and it is delicious' },
                { profile_id: Profile.second.id,
                  title: 'How to install linux',
                  about: 'I am going to show you how to make a live boot usb and
how to use it to install a Linux distro' }
              ])
