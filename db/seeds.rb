# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


password = 'simplebo'
users = [
  {
    firstname: "Julien",
    lastname: "Szabados",
    email: "julien.szabados@simplebo.fr",
    password: password
  },
  {
    firstname: "Abdel",
    lastname: "Ben.K",
    email: "abdel.benkhadra@simplebo.fr",
    password: password
  },
  {
    firstname: "Sonia",
    lastname: "Hamrani",
    email: "sonia.hamrani@simplebo.fr",
    password: password
  }
]

users.each do |user_params|
  User.create(user_params)
end

rooms = [
  {
    title: "Team Simplébo",
    description: "Chat de la team Simplébo",
    persist: true
  },
  {
    title: "Développeurs",
    description: "Chat des devs",
    persist: true
  },
  {
    title: "Marketing",
    description: "Chat des marketeux",
    persist: false
  }
]

rooms.each do |room_params|
  ChatRoom.create(room_params)
end
