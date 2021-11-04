# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Company.create!([
  {name:'ホンダ'},
  {name:'ヤマハ'},
  {name:'カワサキ'},
  {name:'スズキ'}
  ])

Cc.create!([
  {digit:'50cc以下'},
  {digit:'51～125cc'},
  {digit:'126～250cc'},
  {digit:'251～400cc'},
  {digit:'401～750cc'},
  {digit:'751cc以上'}
  ])