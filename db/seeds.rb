# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

@kendall = Dealership.create!(name: 'Kendall Toyota', offers_financing: true, offers_shuttle: false, rating: 3)

  @tacoma = @kendall.vehicles.create!(make: 'Toyota', model: 'Tacoma TRD Sport', year: 2013, sale_pending: true)
  @sequoia = @kendall.vehicles.create!(make: 'Toyota', model: 'Sequoia SR5', year: 2018, sale_pending: true)
  @highlander = @kendall.vehicles.create!(make: 'Toyota', model: 'Highlander SR5', year: 2021, sale_pending: false) 
  @supra = @kendall.vehicles.create!(make: 'Toyota', model: 'Supra', year: 2022, sale_pending: false)

@lithia = Dealership.create!(name: 'Lithia Chrysler', offers_financing: false, offers_shuttle: true, rating: 4)

  @daytona = @lithia.vehicles.create!(make: 'Dodge', model: 'Daytona Shelby Z', year: 1987, sale_pending: true)
  @wrangler = @lithia.vehicles.create!(make: 'Jeep', model: 'Wrangler Unlimited Rubicon', year: 2018, sale_pending: true)
  @ram = @lithia.vehicles.create!(make: 'Ram', model: '1500', year: 2022, sale_pending: true)
  @lebaron = @lithia.vehicles.create!(make: 'Chrysler', model: 'LeBaron', year: 1995, sale_pending: false)

@power = Dealership.create!(name: 'Power Kia', offers_financing: true, offers_shuttle: true, rating: 5)

  @integra = @power.vehicles.create!(make: 'Acura', model: 'Integra Type-R', year: 2001, sale_pending: true)
  @wrangler_tj = @power.vehicles.create!(make: 'Jeep', model: 'Wrangler Sport', year: 2004, sale_pending: true)
  @a4 = @power.vehicles.create!(make: 'Audi', model: 'A4 1.8T', year: 2004, sale_pending: true)
  @telluride = @power.vehicles.create!(make: 'Kia', model: 'Telluride', year: 2022, sale_pending: false)
