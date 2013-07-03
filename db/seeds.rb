Admin.create(email: 'admin@example.com', password: 'password1')
User.create(email: 'user@example.com', password: 'password1')
User.create(email: 'user2@example.com', password: 'password1')

m1 = Manufacturer.create(name: 'Huy Fong')
m2 = Manufacturer.create(name: 'Cholua')
m3 = Manufacturer.create(name: 'Cajun Injector')
m4 = Manufacturer.create(name: 'Ass Kickin\'')
m5 = Manufacturer.create(name: 'Dave\'s Gourmet')
m6 = Manufacturer.create(name: 'mad dog')
m7 = Manufacturer.create(name: 'Black Market Hot Sauce')
m8 = Manufacturer.create(name: 'Bacon Hot Sauce')
m9 = Manufacturer.create(name: 'Candy Crate')

s1 = Sauce.create(name: 'Sriracha Hot Chili Sauce', manufacturer_id: m1.id)
s2 = Sauce.create(name: 'Original Mexican Hot Sauce', manufacturer_id: m2.id)
Sauce.create(name: 'Louisiana Brand Hot Sauce', manufacturer_id: m3.id)
Sauce.create(name: 'Pure Habanero', manufacturer_id: m4.id)
Sauce.create(name: 'Dave\'s Ghost Pepper Naga Jolokia Hot Sauce', manufacturer_id: m5.id)
Sauce.create(name: 'Satan\'s Blood Hot Sauce', manufacturer_id: m6.id)
Sauce.create(name: 'Cambodian Hot Sauce', manufacturer_id: m7.id)
Sauce.create(name: 'Bacon Flavored Hot Sauce', manufacturer_id: m8.id)
Sauce.create(name: 'Ass Blaster Hot Sauce', manufacturer_id: m9.id)
Sauce.create(name: 'Ass Kickin\' Original Hot Sauce', manufacturer_id: m9.id)
Sauce.create(name: 'Crazy Mother Pucker\'s Habitual Jalapeno Hot Sauce', manufacturer_id: m9.id)

f1 = Flavor.create(name: 'spicy')
f2 = Flavor.create(name: 'bitter')
f3 = Flavor.create(name: 'sweet')
f4 = Flavor.create(name: 'sour')
f5 = Flavor.create(name: 'smoky')

r1 = Review.new
r1.user = User.first
r1.sauce = s1
r1.rating = 1
r1.flavors = [f1, f2, f3]
r1.save

r2= Review.new
r2.user = User.last
r2.sauce = s1
r2.rating = 1
r2.flavors = [f2, f3, f4]
r2.save

r3 = Review.new
r3.user = User.first
r3.sauce = s2
r3.rating = -1
r3.flavors = [f4, f5]
r3.save

puts 'Done seeding.'
