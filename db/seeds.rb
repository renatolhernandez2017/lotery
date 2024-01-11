# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts 'Inserindo Usuários'
[
  {
    name: 'Renato Hernandez',
    email: 'renatolhernandez@hotmail.com',
    active_role: 'admin',
    profile: 'admin',
    password: '120711'
  }
].each do |user|
  new_user = User.new(user)
  new_user.save(validate: false)
end

ActiveRecord::Base.connection.reset_pk_sequence!(:users)
