# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)


# u=User.create(
#     department:'Pools',
#     status:'Employed',
#     name: 'Nishant',
#     password: '12345',
#     email: 'abc@gmail.com',
#     u_kind: 'admin'

# )

# 20.times do |x|
#     User.create(
#         department:"Pools#{x+1}",
#         status:"Employed#{x+1}",
#         name: "Nishant#{x+1}",
#         password: "12345#{x+1}",
#         email: "abc@gmail.com#{x+1}",
#         u_kind: 'admin'
    
#     )
e=Expense.create(
    user_id:1,
    invoice_id:"22dcd",
    date:"15th",
    desc:"descr",
    amount:123,
    status:"reimbursed"

)

